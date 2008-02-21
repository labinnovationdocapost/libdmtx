#!/bin/sh

ERROR_COUNT=0

echo "Comparing generated barcodes against Seimens results"
echo "-----------------------------------------------------------------"

for file in compare_siemens/siemens_*_?.png; do

   TEST_BARCODE=compare_generated/$(basename $file | sed -e 's/^siemens_/barcode_/')

   if [[ ! -r "$TEST_BARCODE" ]]; then
      continue
   fi

   diff $file $TEST_BARCODE
   ERROR=$?

   if [[ "$ERROR" -ne 0 ]]; then
      ERROR_COUNT=$[$ERROR_COUNT + 1]
   fi

done

echo "$ERROR_COUNT difference(s) found"
echo ""

exit 0