# Retrieval Augmented Generation (RAG) with AI21's Contextual Answers Task-Specific-Model
A step by step guide of how the run AI21's Contextual Answers Task-Specific-Model on Virgin Atlantic help center docs.

## Step 1: Download the help center website 
```
mkdir ~/Desktop/virgin-help-center
mkdir ~/Desktop/virgin-help-center/raw-website
cd ~/Desktop/virgin-help-center/raw-website
wget --recursive -A.html https://help.virginatlantic.com/gb/en.html
```

## Step 2: Copy all html files to a dedicated folder 
```
cd ~/Desktop/virgin-help-center/raw-website/help.virginatlantic.com/gb/en/
mkdir ~/Desktop/virgin-help-center/txt-website
find ./ -name "*.html" -exec cp {} ~/Desktop/virgin-help-center/txt-website
```

## Step 3: Convert html files to txt files 
```
cd ~/Desktop/virgin-help-center/txt-website
textutil -convert txt *.html
rm *.html
```

## Step 4: Split files into sub-folders, each with up to 30 text files (AI21's document library interface allows to upload up to 30 text files in each bulk) 
```
i=0; for f in *; do d=dir_$(printf %03d $((i/30+1))); mkdir -p $d; mv "$f" $d; let i++; done
```

## Step 5: Upload text files to the Document Library
Go to [AI21 Studio Document Library](https://studio.ai21.com/documents) and upload the text files.
