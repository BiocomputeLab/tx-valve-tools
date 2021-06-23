
db=demultiplexed/barcode07
refs=_references/

cat $db/*.fastq > $db/all.fastq

cat $db/all.fastq | paste - - - - | sed 's/^@/>/g'| cut -f1-2 | tr '\t' '\n' > $db/all.fasta

makeblastdb -in $db/all.fasta -parse_seqids -dbtype nucl
