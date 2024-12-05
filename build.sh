#!/usr/bin/env bash

echo "Cleaning up..."
rm -rf FLEX/ src/

echo "Copying sources..."
mkdir src/
git clone --depth=1 https://github.com/FLEXTool/FLEX
find FLEX/Classes -type f \( -name "*.h" -o -name "*.m" -o -name "*.mm" -o -name "*.c" \) -exec cp {} src/ \;

FILE="src/FLEXSwiftInternal.mm"

# Replace "std::atomic<mask_t> _maybeMask;" with "mask_t _maybeMask;" on line 59
sed -i '' '59s/std::atomic<mask_t> _maybeMask;/mask_t _maybeMask;/' "$FILE"
# Replace "std::atomic<preopt_cache_t *> _originalPreoptCache;" with "preopt_cache_t * _originalPreoptCache;" on line 65
sed -i '' '65s/std::atomic<preopt_cache_t \*> _originalPreoptCache;/preopt_cache_t \* _originalPreoptCache;/' "$FILE"

# Rename all occurrences of FLEXManager to FLEXManagerTwo in src/
echo "Renaming FLEXManager to GetFLEXedOn..."
find src/ -type f -exec sed -i '' 's/FLEXManager/GetFLEXedOn/g' {} +

# Rename files with FLEXManager in their names to GetFLEXedOn
echo "Renaming files with FLEXManager in their names..."
find src/ -type f -name "*FLEXManager*" | while read -r file; do
    new_file=$(echo "$file" | sed 's/FLEXManager/GetFLEXedOn/g')
    mv "$file" "$new_file"
done

echo "Building package..."
make package
