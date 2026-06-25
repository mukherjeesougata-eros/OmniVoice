# Voice Cloning
# ref_text can be omitted (Whisper will auto-transcribe ref_audio to get it).
# omnivoice-infer \
#     --model /mnt/data0/Sougata/TTS/OmniVoice/OmniVoice/examples/exp/omnivoice_finetune/Indian_26_languages/checkpoint-5000 \
#     --text "[laughter] नमस्ते! मैं आपकी যদি তোর ডাক শুনে किस प्रकार [question-yi] सहायता कर একলা চলো রে सकता हूँ [surprise-ah]?" \
#     --ref_audio /mnt/data0/Sougata/TTS/OmniVoice/single_infer/Noisy_speech/noisy_speech.wav \
#     --ref_text "तुम्हारे पास तीन महीने बचे हैं।" \
#     --output /mnt/data0/Sougata/TTS/OmniVoice/single_infer/fullFT/Voice_clone/output_hindi_with_bengali_laughter_begin_question-yi_middle_surprise-ah_end_w_noisy_ref_audio_guidance_scale=3.wav \
    #--guidance_scale 3.0
    #--denoise False \

# # Voice Design
# omnivoice-infer --model /mnt/data0/Sougata/TTS/OmniVoice/OmniVoice/examples/exp/omnivoice_finetune/Indian_26_languages/checkpoint-5000 \
#     --text "भारत एक अत्यंत प्राचीन और सांस्कृतिक रूप से समृद्ध देश है। यहाँ की सबसे बड़ी विशेषता 'अनेकता में एकता' है।" \
#     --instruct "happy" \
#     --output /mnt/data0/Sougata/TTS/OmniVoice/single_infer/fullFT/Voice_design/Emotions/output_hindi-2_voice_design-happy.wav \
# #     --num_step 250 \
# #     --guidance_scale 10
# #     #--speed 0.5


# #Auto Voice
omnivoice-infer \
    --model /mnt/data0/Sougata/TTS/OmniVoice/OmniVoice/examples/exp/omnivoice_finetune/Indian_26_languages/checkpoint-5000 \
    --text "भारत एक अत्यंत प्राचीन और सांस्कृतिक रूप से समृद्ध देश है। यहाँ की सबसे बड़ी विशेषता 'अनेकता में एकता' है। इस विशाल देश में विभिन्न धर्मों, जातियों और संप्रदायों के लोग सदियों से एक साथ मिल-जुलकर रहते हैं। यहाँ हर राज्य की अपनी एक अनूठी भाषा, पहनावा, लोक नृत्य और खान-पान की परंपरा है। उत्तर में हिमालय की बर्फीली चोटियों से लेकर दक्षिण में हिंद महासागर के तटों तक, भारत की भौगोलिक और सांस्कृतिक विविधता हर किसी को आकर्षित करती है। यहाँ मनाए जाने वाले त्योहार, जैसे दिवाली, ईद, होली और पोंगल, लोगों के बीच आपसी प्रेम और भाईचारे को बढ़ाते हैं। यही कारण है कि दुनिया भर से लोग भारत की इस अद्भुत संस्कृति को देखने और समझने के लिए खिंचे चले आते हैं। भारत की यही विविधता इसकी सबसे बड़ी ताकत और पहचान है।"\
    --output /mnt/data0/Sougata/TTS/OmniVoice/single_infer/fullFT/output_hindi-3_dur=40.0_pp-op=False.wav \
    --duration 40.0 \
    --device cuda \
    --postprocess_output False
#     --speed 1.2 \
#     --num_step 1024
#     --device cud
    #--preprocess_prompt False \
    #--postprocess_output False
    #--speed 3.0
    #--duration 14.0



#Consolidated
# omnivoice-infer \
#     --model /mnt/data0/Sougata/TTS/OmniVoice/OmniVoice/examples/exp/omnivoice_finetune/Indian_26_languages/checkpoint-5000 \
#     --text "[laughter] नमस्ते! मैं आपकी যদি তোর ডাক শুনে किस प्रकार [question-yi] सहायता कर একলা চলো রে सकता हूँ [surprise-ah]?"\
#     --speed 0.5 \
#     --ref_audio /mnt/data0/Sougata/TTS/OmniVoice/single_infer/Noisy_speech/noisy_speech.wav \
#     --ref_text "तुम्हारे पास तीन महीने बचे हैं।" \
#     --instruct "female, child, high pitch" \
#     --output /mnt/data0/Sougata/TTS/OmniVoice/single_infer/fullFT/rough.wav #\
    # --duration 0.000000000000001 \
    # --guidance_scale 9.0 \
    # --speed 0.5 \
    # --denoise False \
    # --preprocess_prompt True \
    # --postprocess_output True
