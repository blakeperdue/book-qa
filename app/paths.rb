@paths = OpenStruct.new(
  files_in: OpenStruct.new(
    process_before_qa: 'files-in/1-before-qa',
    process_after_qa: 'files-in/2-after-qa'
  ),
  files_out: OpenStruct.new(
    ready_for_qa: 'files-out/1-ready-for-qa',
    done_needs_review: 'files-out/2-flagged-for-review',
    done: 'files-out/3-completed'
  ),
  log: 'log',
  db: 'db/books.db',
  reports: 'reports'
)
