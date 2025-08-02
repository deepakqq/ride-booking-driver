import os
import sys
import re

def find_file_recursive(base_dir, file_name):
    matches = []
    for root, dirs, files in os.walk(base_dir):
        for file in files:
            if file == file_name:
                matches.append(os.path.join(root, file))
    return matches

def extract_strings_from_file(file_path):
    with open(file_path, 'r', encoding='utf-8') as f:
        content = f.read()

    # Strings inside Text(...) only
    text_matches = re.findall(r'Text\s*\(\s*["\'](.+?)["\']', content)

    # All quoted strings (single and double quotes)
    all_quoted_matches = re.findall(r'["\'](.+?)["\']', content)

    # Merge both and remove duplicates
    combined = set(text_matches + all_quoted_matches)
    return list(combined)

def main():
    if len(sys.argv) < 2:
        print("❌ Please provide a file name like: landlord_help_screen.dart")
        return

    file_name = sys.argv[1]
    base_dir = os.path.join(os.path.dirname(__file__), '../lib')

    if not os.path.isdir(base_dir):
        print("❌ 'lib' folder not found.")
        return

    matches = find_file_recursive(base_dir, file_name)

    if not matches:
        print(f"❌ No matching file found under lib/ named: {file_name}")
        return

    for match in matches:
        print(f"\n🔍 Found: {match}")
        strings = extract_strings_from_file(match)

        if not strings:
            print("⚠️ No strings found in Text() or string literals.")
        else:
            print("✅ Strings found:")
            for s in strings:
                print(f"- {s}")

if __name__ == '__main__':
    main()