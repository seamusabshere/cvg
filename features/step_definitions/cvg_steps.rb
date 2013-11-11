def cvgme(args, input_csv_paths)
  bin_path = File.expand_path '../../../bin/cvg', __FILE__
  cmd = "#{bin_path} #{args.join(' ')} #{input_csv_paths.join(' ')}"
  child = POSIX::Spawn::Child.new cmd
  if child.err.present?
    $stderr.puts
    $stderr.puts cmd
    $stderr.puts child.err
    $stderr.puts
  end
  child.out.strip
end

Before do
  @input_csv_paths = []
  @args = []
end

Given(/^an input csv$/) do |string|
  path = File.join(Dir.tmpdir, "#{rand.to_s}.csv")
  File.write(path, string)
  @input_csv_paths << path
end

When(/^you pass arguments (.+)$/) do |args|
  @args << args.strip
end

Then(/^you get output$/) do |expected_output_csv|
  got_csv = cvgme(@args, @input_csv_paths)
  expect(got_csv).to eq(expected_output_csv.strip)

  expected_count = CSV.parse(expected_output_csv.strip, headers: :first_row).length
  got_count = cvgme((@args + ['--count']), @input_csv_paths)
  expect(got_count).to match(/Count: #{expected_count}/)

  @input_csv_paths.each do |path|
    if File.dirname(File.expand_path(path)).start_with?(Dir.tmpdir)
      File.unlink path
    end
  end
end
