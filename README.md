# Feeding AI21's Document Library with Virgin Atlantic Help Center

This guide provides a step-by-step walkthrough for seamlessly incorporating Virgin Atlantic's help center documents into AI21's Document Library, for demonstating Contextual Answers.

## Overview

Feeding the Document Library with Virgin Atlantic's help center, involves downloading the help center website, converting HTML files to text, organizing them into manageable sub-folders, and finally, uploading them to AI21's Document Library. 

## Steps

### Step 1: Download the Help Center Website
```bash
# Create a directory for the project and navigate into it.
mkdir ~/Desktop/virgin-help-center
mkdir ~/Desktop/virgin-help-center/raw-website
cd ~/Desktop/virgin-help-center/raw-website
# Use wget to recursively download the Virgin Atlantic help center website.
wget --recursive -A.html https://help.virginatlantic.com/gb/en.html
```

 
### Step 2: Copy HTML Files to a Dedicated Folder
```bash
# Navigate to the downloaded directory and create a folder for text files.
cd ~/Desktop/virgin-help-center/raw-website/help.virginatlantic.com/gb/en/
mkdir ~/Desktop/virgin-help-center/txt-website
# Use find and cp commands to copy all HTML files to the text folder.
find ./ -name "*.html" -exec cp {} ~/Desktop/virgin-help-center/txt-website \;
```

### Step 3: Convert HTML Files to TXT Files
```bash
# Navigate to the text folder and use textutil to convert HTML files to plain text.
cd ~/Desktop/virgin-help-center/txt-website
textutil -convert txt *.html
# Remove the original HTML files.
rm *.html
```

### Step 4: Organize Files into Sub-Folders
```bash
# Use a bash script to split text files into sub-folders, each containing up to 30 files.
i=0; for f in *; do d=dir_$(printf %03d $((i/30+1))); mkdir -p $d; mv "$f" $d; let i++; done
```

### Step 5: Upload Text Files to the Document Library
Visit the [AI21 Studio Document Library](https://studio.ai21.com/documents) and upload the organized text files.
This step completes the integration, enabling to utilize Virgin Atlantic help center data with Contextual Answers.
