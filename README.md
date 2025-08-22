# Deploy Flask App on Google Cloud Compute Engine

<p> This repository contains the code and instructions to deploy a simple Python Flask web application on Google Cloud Compute Engine (GCE). </p>

### Medium Article
<a href="https://lnkd.in/gnzta6KW">Read the full step-by-step guide on Medium</a>

### Architecture
<img width="738" height="544" alt="image" src="https://github.com/user-attachments/assets/f738520d-d4a3-4642-a618-9610e044a8d0" />

Steps:

#### 1. Configure GCP project & zone
```
gcloud auth login
gcloud config set project <PROJECT_ID>
gcloud config set compute/zone us-central1-a

```

#### 2. Enable Compute Engine API
```
gcloud services enable compute.googleapis.com

```

#### 3. Create VM with startup script


   <img width="2376" height="776" alt="image" src="https://github.com/user-attachments/assets/ac5200f1-4a95-4b99-82d3-0b9ae9b3b398" />

   <img width="2434" height="1250" alt="image" src="https://github.com/user-attachments/assets/27097997-84a8-4eb8-b77f-a6dee1a42f13" />


   ```
   gcloud compute instances create vmworkshop \
  --image-family=debian-12 \
  --image-project=debian-cloud \
  --machine-type=e2-micro \
  --tags=flask-server \
  --metadata-from-file startup-script=startup.sh
  ```
#### 4. Allow traffic on port 8080
```
gcloud compute firewall-rules create allow-flask-8080 \
  --allow tcp:8080 \
  --target-tags=flask-server \
  --direction=INGRESS

```

#### 5. Access your app
<p>Open in browser:</p>

```
http://<EXTERNAL_IP>:8080
```

#### Optional: Scaling with Load Balancer

<p>See the full Medium article for detailed steps.</p>

<strong>
<p>Trobulshooting Steps
login cloud auth login ﻿ ﻿
set configuration ﻿ ﻿ ﻿ ﻿
i.e:
cloud config set project <project_name>
Cloud config set compute/zone us-central1-b

Gcloud services enable compute.googleapis.com ﻿
SSH vmworkshop.us-central1-a.gcpcomputewebengine ﻿ ﻿
clone the repo using git or locally ﻿ ﻿ ﻿ using command ﻿
get into that directory
enable firewall and Add network tag to your VM 
run the flask app and verify the hosted app using  ﻿http://34.61.128.236:8080/
</p>
</strong>
