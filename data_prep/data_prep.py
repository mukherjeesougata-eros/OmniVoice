import json
import re

# -----------------------------
# Language mappings (fallback)
# -----------------------------
lang_name_map = {
    "assamese": "as",
    "bengali": "bn",
    "bodo": "brx",
    "dogri": "dgo",
    "gujarati": "gu",
    "hindi": "hi",
    "kannada": "kn",
    "konkani": "knn",
    "maithili": "mai",
    "malayalam": "ml",
    "manipuri": "mni",
    "marathi": "mr",
    "nepali": "npi",
    "odia": "ory",
    "punjabi": "pa",
    "rajasthani": "rajasthani",
    "sanskrit": "sa",
    "sindhi": "sd",
    "tamil": "ta",
    "telugu": "te",
    "urdu": "ur",
    "santali": "sat"
}

# -----------------------------
# Replacement mapping
# -----------------------------
replace_map = {
    "doi": "dgo",
    "kon": "knn",
    "ne": "npi",
    "or": "ory"
}

# -----------------------------
# Extract language_id
# -----------------------------
def extract_language_id(audio_id):
    lang = None

    # Case 1: IISc_SYSPINProject_XXX_
    match = re.search(r"IISc_SYSPINProject_([^_]+)_", audio_id)
    if match:
        lang = match.group(1)

    # Case 2: IV_XXX_
    elif audio_id.startswith("IV_"):
        match = re.search(r"IV_([^_]+)_", audio_id)
        if match:
            lang = match.group(1)

    # Case 3: Ra_XXX_
    elif audio_id.startswith("Ra_"):
        match = re.search(r"Ra_([^_]+)_", audio_id)
        if match:
            lang = match.group(1)

    # -----------------------------
    # Apply replacements
    # -----------------------------
    if lang:
        lang = lang.lower()
        if lang in replace_map:
            lang = replace_map[lang]
        return lang

    # -----------------------------
    # Fallback: language name match
    # -----------------------------
    audio_id_lower = audio_id.lower()
    for name, code in lang_name_map.items():
        if name in audio_id_lower:
            return code

    return "unknown"


# -----------------------------
# Convert TSV → JSONL
# -----------------------------
input_tsv = "/mnt/data0/Sougata/TTS/ZipVoice_l/ZipVoice/egs/zipvoice/data_l/raw/custom_dev.tsv"
output_jsonl = "Indian_26_languages_dev.jsonl"

with open(input_tsv, "r", encoding="utf-8") as fin, \
     open(output_jsonl, "w", encoding="utf-8") as fout:

    for line in fin:
        parts = line.strip().split("\t")

        if len(parts) != 3:
            continue  # skip bad rows

        audio_id, text, audio_path = parts

        lang_id = extract_language_id(audio_id)

        obj = {
            "id": audio_id,
            "audio_path": audio_path,
            "text": text,
            "language_id": lang_id
        }

        fout.write(json.dumps(obj, ensure_ascii=False) + "\n")

print("✅ JSONL file created:", output_jsonl)