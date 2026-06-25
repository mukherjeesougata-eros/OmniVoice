set -euo pipefail

# Specify the stages to run by setting the `stage` and `stop_stage` variables. 
# stage=1
# stop_stage=6

# Available GPUs for evaluation. Adjust this according to your setup.
export CUDA_VISIBLE_DEVICES="0,1,2,3,4,5,6,7"

# Specify the checkpoint to evaluate.
CHECKPOINT=/mnt/data0/Sougata/TTS/OmniVoice/OmniVoice/examples/exp/omnivoice_finetune/Indian_26_languages/checkpoint-5000

python -m omnivoice.cli.infer_batch \
        --model "${CHECKPOINT}" \
        --test_list "/mnt/data0/Sougata/TTS/OmniVoice/OmniVoice/examples/data/Indian_26_languages/Indian_26_languages_test.jsonl" \
        --res_dir "/mnt/data0/Sougata/TTS/OmniVoice/OmniVoice/examples/results/Indian_26_languages" \
        --preprocess_prompt False \
        --postprocess_output False \
        --batch_duration 600 \
        --audio_chunk_threshold 1000