import os
import requests

def download_captions(captions, download_folder_path, title_of_output_mp4, captions_list):
    filtered_captions = [caption for caption in captions if caption["locale_id"] in captions_list]

    for caption in filtered_captions:
        response = requests.get(caption['url'])
        response.raise_for_status()
        if caption['file_name'].endswith('.vtt'):
            caption_name = f"{title_of_output_mp4} - {caption['video_label']}.vtt"
            with open(os.path.join(download_folder_path, caption_name), 'wb') as file:
                file.write(response.content)
        else:
            pass
            # Only VTT captions are supported. Please create a github issue if you'd like to add support for other formats. 