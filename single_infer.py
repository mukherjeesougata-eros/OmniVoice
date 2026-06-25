from omnivoice.models.omnivoice_modified import OmniVoice
import soundfile as sf
import torch
import torchaudio

model = OmniVoice.from_pretrained(
    "/mnt/data0/Sougata/TTS/OmniVoice/models/Emotions/1/checkpoint-5000",
    device_map="cuda:5",
    dtype=torch.float16
)
# Apple Silicon users: use device_map="mps" instead
# Intel Arc GPU users: use device_map="xpu" instead

#Voice Cloning
# audio = model.generate(
#     text="Hello, this is a test of zero-shot voice cloning.",
#     ref_audio="ref.wav",
#     ref_text="Transcription of the reference audio.",
# ) # audio is a list of `np.ndarray` with shape (T,) at 24 kHz.

#Voice Design
audio = model.generate(
    text="अरे वाह, यह तो बढ़िया है! मुझे एक ऐसी अलमारी चाहिए जो मेरे बेडरूम में जँचे।",
    instruct="happy",
)

# If you don't want to input `ref_text` manually, you can directly omit the `ref_text`.
# The model will use Whisper ASR to auto-transcribe it.

#sf.write("/mnt/data0/Sougata/TTS/OmniVoice/single_infer/fullFT/Voice_design/Emotions/output_hindi_voice_design-happy.wav", audio[0], 24000)
torchaudio.save("/mnt/data0/Sougata/TTS/OmniVoice/single_infer/fullFT/Voice_design/Emotions/output_hindi_voice_design-happy.wav", audio[0], 24000)