function RunCppProgram()
	local filename = vim.fn.expand("%:p")
	vim.fn.fnamemodify(filename, ":t:r")

	if filename:match("%.cpp$") then
		local compile_command = "g++ -std=c++17 " .. filename .. " -o main 2> output.txt"
		vim.fn.system(compile_command)
		if vim.v.shell_error == 0 then
			local timeout_command = 'ulimit -t 5 && (./main > output.txt 2>&1 || echo "TLE" > output.txt)'
			vim.fn.system(timeout_command)
		else
			print("Compilation failed")
		end
		vim.fn.system('tmux send-keys -t 2 ":e" Enter')
		vim.fn.system('tmux send-keys -t 2 "nvim output.txt" Enter')
	else
		print("Current file is not a C++ source file.")
	end
end

vim.api.nvim_command("command! Com lua RunCppProgram()")

