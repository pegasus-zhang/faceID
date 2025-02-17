mkdir faceID_deploy 
cp -r config data/known_people weights workspace lib faceID_deploy/
rsync -avz --progress faceID_deploy/* titan@192.168.31.219:/home/titan/02_projects/faceID/