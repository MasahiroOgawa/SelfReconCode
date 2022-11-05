#!/bin/sh

echo "Install"
conda env create -f environment.yml
conda activate SelfRecon
bash install.sh

echo "install pytorch3d 0.4.0 from source"
wget -O pytorch3d-0.4.0.zip https://github.com/facebookresearch/pytorch3d/archive/refs/tags/v0.4.0.zip
unzip pytorch3d-0.4.0.zip
cd pytorch3d-0.4.0 && python setup.py install && cd ..

echo "download SMPL models"
# # This is impossible because the author need authentication to download models.
# (
#     wget -P smpl_pytorch/model/ https://mailustceducn-my.sharepoint.com/personal/jby1993_mail_ustc_edu_cn/_layouts/15/onedrive.aspx?id=%2Fpersonal%2Fjby1993%5Fmail%5Fustc%5Fedu%5Fcn%2FDocuments%2Fmodel&ga=1
# )
