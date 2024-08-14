import yt_dlp

def download_youtube_playlist(playlist_url, output_dir, resolution):
    # ydl_opts = {
    # 'format': 'bestvideo+bestaudio/best',  # Tries best video + best audio, then best single file
    # 'outtmpl': f'{output_dir}/%(title)s.%(ext)s',
    # 'noplaylist': False,
    # 'progress_hooks': [download_progress_hook]
    # }

    if resolution == '1080p':
        ydl_opts = {
        'format': '137',  # Format ID for 1080p video
        'outtmpl': f'{output_dir}/%(title)s.%(ext)s',
        'noplaylist': False,
        'progress_hooks': [download_progress_hook]
        }
    elif resolution == '720p':
        ydl_opts = {
            'format': 'bestvideo[height<=720]+bestaudio/best[height<=720]',
            'outtmpl': f'{output_dir}/%(title)s.%(ext)s',
            'noplaylist': False,
            'progress_hooks': [download_progress_hook]
        }
    elif resolution == '480p':
        ydl_opts = {
            'format': 'bestvideo[height<=480]+bestaudio/best[height<=480]',
            'outtmpl': f'{output_dir}/%(title)s.%(ext)s',
            'noplaylist': False,
            'progress_hooks': [download_progress_hook]
        }
    else:
        print("Invalid resolution selected.")
        return

    with yt_dlp.YoutubeDL(ydl_opts) as ydl:
        ydl.download([playlist_url])



def download_progress_hook(d):
    if d['status'] == 'finished':
        print(f"Done downloading {d['filename']}")
    elif d['status'] == 'downloading':
        print(f"Downloading {d['_percent_str']} of {d['filename']}")



def download_subtitles_from_playlist(playlist_url, output_dir='subtitles'):
    ydl_opts = {
        'writeautomaticsub': True,  # Download automatically generated subtitles if available
        'writesubtitles': True,  # Download manually created subtitles if available
        'subtitleslangs': ['en'],  # Replace 'en' with the desired language code, e.g., 'es' for Spanish
        'skip_download': True,  # Skip video download, only download subtitles
        'outtmpl': f'{output_dir}/%(title)s.%(ext)s',
        'noplaylist': False,  # Download subtitles for all videos in the playlist
    }

    with yt_dlp.YoutubeDL(ydl_opts) as ydl:
        ydl.download([playlist_url])


if __name__ == '__main__':
    output_dir='~/YouTube/downloads/'

    playlist_url = input("Enter YouTube playlist URL: ")
    resolution = input("Enter desired resolution (1080p, 720p or 480p): ")

    download_youtube_playlist(playlist_url, output_dir, resolution)
    
    subtitle = input("Do you want to download subtitles yes(1) or no(0) :")

    if subtitle == 1:
        download_subtitles_from_playlist(playlist_url)
        Print("Download successful!!!")
    else:
        print("Download Finished!!!")
