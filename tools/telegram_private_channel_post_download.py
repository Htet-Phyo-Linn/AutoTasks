
import re
import os
import asyncio
from telethon import TelegramClient
from telethon.errors.rpcerrorlist import ChannelPrivateError, ChannelInvalidError
from dotenv import load_dotenv

# Load API credentials from .env file
load_dotenv("config.env")

api_id = int(os.getenv('API_ID'))
api_hash = os.getenv('API_HASH')

# Create a session file named 'user_session.session'
client = TelegramClient('user_session', api_id, api_hash)


def parse_link(link):
    match = re.search(r'/c/(\d+)/(\d+)', link)
    if not match:
        raise ValueError(f"Invalid link format: {link}")
    raw_channel_id = match.group(1)
    message_id = int(match.group(2))

    # Convert short ID to internal Telegram channel ID
    real_channel_id = int(f"-100{raw_channel_id}")
    return real_channel_id, message_id


async def fetch_grouped_messages(channel, grouped_id, target_msg_id):
    grouped_msgs = []

    # Include the actual message (which was skipped previously)
    try:
        target_msg = await client.get_messages(channel, ids=target_msg_id)
        if target_msg and target_msg.grouped_id == grouped_id:
            grouped_msgs.append(target_msg)
    except Exception as e:
        print(f"⚠ Failed to fetch target message {target_msg_id}: {e}")

    # Fetch older parts
    async for msg in client.iter_messages(channel, offset_id=target_msg_id, reverse=True):
        if msg.grouped_id == grouped_id:
            grouped_msgs.append(msg)
        else:
            break

    # Fetch newer parts
    async for msg in client.iter_messages(channel, min_id=target_msg_id):
        if msg.grouped_id == grouped_id:
            grouped_msgs.append(msg)
        else:
            break

    # Remove duplicates & sort
    unique_msgs = {msg.id: msg for msg in grouped_msgs}
    return sorted(unique_msgs.values(), key=lambda m: m.id)


async def download_from_link(link):
    try:
        channel_id, message_id = parse_link(link)
    except ValueError as e:
        print(e)
        return

    try:
        channel = await client.get_entity(channel_id)
    except (ChannelPrivateError, ChannelInvalidError, ValueError) as e:
        print(f"Cannot access channel for link {link}: {e}")
        return

    message = await client.get_messages(channel, ids=message_id)
    if not message or not message.media:
        print(f"❌ No media found in message {message_id} for link {link}")
        return

    # Create folder for the post
    folder = f"post_{message_id}"
    os.makedirs(folder, exist_ok=True)

    # Handle grouped media (albums)
    if message.grouped_id:
        grouped_id = message.grouped_id
        print(f"📦 Message is part of a media group (grouped_id={grouped_id})")

        grouped_msgs = await fetch_grouped_messages(channel, grouped_id, message_id)

        if not grouped_msgs:
            print("⚠ No grouped messages found.")
            return

        print(f"⬇️ Downloading {len(grouped_msgs)} media items to {folder}")

        for i, msg in enumerate(grouped_msgs, start=1):
            if msg.media:
                filename = os.path.join(folder, f"part_{i}")
                print(f"📥 Downloading media part {i} as {filename}...")
                await msg.download_media(file=filename)

        print(f"✅ Downloaded all {len(grouped_msgs)} media items to '{folder}'")
    else:
        filename = os.path.join(folder, f"{message_id}")
        print(f"📥 Downloading single media from {link} as {filename}...")
        await message.download_media(file=filename)
        print(f"✅ Downloaded: {filename}")


async def main():
    if not os.path.exists("user_session.session"):
        print("🔐 No session file found. Starting login process...")
        await client.connect()
        if not await client.is_user_authorized():
            phone = input("📱 Enter your phone number: ")
            await client.send_code_request(phone)
            try:
                code = input("💬 Enter the code you received: ")
                await client.sign_in(phone, code)
            except SessionPasswordNeededError:
                pw = input("🔒 2FA Password: ")
                await client.sign_in(password=pw)
    else:
        await client.start()

    # Load links
    with open('links.txt', 'r') as f:
        links = [line.strip() for line in f if line.strip()]

    for link in links:
        await download_from_link(link)

    await client.disconnect()

if __name__ == "__main__":
    asyncio.run(main())
