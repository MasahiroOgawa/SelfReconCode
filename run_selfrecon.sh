# SelfRecon running script
# This is created based on README.md.
# This script should be run on SelfReconCode directory.
# Before run this script, run; $ conda activate SelfRecon


# parameters
ROOT=/mnt/data/study/computer_vision/selfrecon # dataset directory
ROOT1=/home/mas/proj/study/computer_vision/pifuhd # PIFUHD installed directory
ROOT2=/home/mas/proj/study/computer_vision/lightweight-human-pose-estimation.pytorch # lightweight openpose installed directory


echo "Running Preprocess..."
# If you never run below, uncomment below.
#python people_snapshot_process.py --root $ROOT/people_snapshot_public/female-3-casual --save_root $ROOT/female-3-casual

echo "Extracting normals..."
cp generate_normals.py $ROOT1/
cp generate_boxs.py $ROOT2/
(
    cd $ROOT2
    python generate_boxs.py --data $ROOT/female-3-casual/imgs
)
(
    cd $ROOT1
    python generate_normals.py --imgpath $ROOT/female-3-casual/imgs
) 
CUDA_VISIBLE_DEVICES=0 python train.py --gpu-ids 0 --conf config.conf --data $ROOT/female-3-casual --save-folder result

echo "Running Inference..."
#CUDA_VISIBLE_DEVICES=0 python infer.py --gpu-ids 0 --rec-root $ROOT/female-3-casual/result/ --C
