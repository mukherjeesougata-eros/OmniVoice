import json

input_tsv = "/mnt/data0/Sougata/TTS/ZipVoice_l/ZipVoice/egs/zipvoice/data/Test/test_all_lang_renamed.tsv"
output_jsonl = "/mnt/data0/Sougata/TTS/OmniVoice/OmniVoice/examples/data/Indian_26_languages/Indian_26_languages_test.jsonl"

with open(input_tsv, "r", encoding="utf-8") as fin, \
     open(output_jsonl, "w", encoding="utf-8") as fout:

    for line_num, line in enumerate(fin):
        parts = line.strip().split("\t")

        # Skip invalid rows
        if len(parts) != 4:
            print(f"Skipping line {line_num}: invalid format")
            continue

        id_, ref_text, ref_audio, text = parts

        obj = {
            "id": id_,
            "text": text,
            "ref_audio": ref_audio,
            "ref_text": ref_text
        }

        fout.write(json.dumps(obj, ensure_ascii=False) + "\n")

print(f"✅ JSONL file created: {output_jsonl}")