# gcp-tf-modules
Steps to authenticate andrun terraform in gcp:-
1. gcloud auth login
2. gcloud config set project swap-demo-441113
3. gcloud auth activate-service-account --key-file=/Users/preetam/Downloads/swap-demo-441113-a15d2bc76ce4.json   (change path of file according to your folder.)
4. gcloud config get-value project\n
5. gcloud auth application-default login\n
