mkdir faceID_deploy 
cp -r config weights workspace lib ros1_interface faceID_deploy/
mkdir faceID_deploy/data
cp -r data/known_people faceID_deploy/data/
rsync -avz --progress faceID_deploy/* titan@192.168.31.219:/home/titan/02_projects/faceID/