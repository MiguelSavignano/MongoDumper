#***********
# Mongo dumper, and remove old dumps
#***********

DATABASE_NAME = "test"
MAX_DUMPS     = 7
DUMP_DIR      = "./"
OUTDIR        = "#{DUMP_DIR}#{DATABASE_NAME}-#{Time.now.strftime('%Y-%m-%d_%Hh%Mm%Ss')}"

p "Dumping Database to #{OUTDIR}..."
system("mongodump --db #{DATABASE_NAME} --out #{OUTDIR}")
p "dump completed!"
p "Compacting..."
system("tar -cjf #{OUTDIR}.tar.bz2 #{OUTDIR}")
p "Compacted!"
p "Removing Directoy #{OUTDIR}"
system("rm -rf #{OUTDIR}")
p "Removed!"
array_string_files_compress = Dir.glob('#{DUMP_DIR}*.tar.bz2').sort
if array_string_files_compress.size >= MAX_DUMPS
  system("rm -rf #{array_string_files_compress.first}")
  p "Removing old dump"
end
p "Finished"
