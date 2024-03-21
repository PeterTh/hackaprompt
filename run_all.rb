require 'time'
require 'fileutils'
require 'open3'

configs = [
    # CUDA GPU, port, model
    [0, "23890", "CodeBooga-34B"],
    [1, "23891", "WizardCoder-33B"],
    [2, "23892", "deepseek-coder-33b"],
    [3, "23893", "CodeLlama-13B"],
]

FileUtils.mkdir_p 'logs'

configs.each do |config|
    gpu, port, model = config
    # log file with model, port and timestamp
    logfn = "log_#{model}_#{port}_#{Time.now.utc.iso8601}.txt"
    puts "Starting #{model} on gpu #{gpu}, port #{port}, log: #{logfn}"
    `((nohup ./run.sh #{gpu} config.#{port}.#{model}.yml > logs/#{logfn} 2>&1 &)&)`
    sleep(5) # yes, sleep sync! Pretty horrible (to make sure the config is loaded before the next run)
end
