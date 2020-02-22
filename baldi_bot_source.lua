local discordia = require('discordia')
local guild = discordia.guild
local client = discordia.Client()
i = 0
local creationdisabled = false;
local creatorauthor = nil;
local creationphase = 0
local customcommandnames = {};
local customcommandresponses = {};
local customcommandauthors = {};
local BotSettings = {
	['Token'] = "Bot REDACTED"; --Original Code:
	['Prefix'] = "b.";  --Dev Code: REDACTED
	['TerminateCommand'] = "b.exit";
	['DefaultPlay'] = "Baldi's Basics Discord Server";
	['Emoji'] = {"😋","🐱","😑","😯","💻","🙃","⚠️","💯","🆗","😜","😃","😭","❤️","💚","💙","💔","😕","😵","👌","🙀","😠","😖","🤗","🙂","😒","🤤","👌","🐶","🌠","🌈","😍","😎","🤪"};
	['Baldipedia'] = {"https://baldis-basics-in-education-and-learning.wikia.com/wiki/Baldi","https://baldis-basics-in-education-and-learning.wikia.com/wiki/1st_Prize","https://baldis-basics-in-education-and-learning.wikia.com/wiki/Playtime","https://baldis-basics-in-education-and-learning.wikia.com/wiki/It%27s_a_Bully","https://baldis-basics-in-education-and-learning.wikia.com/wiki/Gotta_Sweep","https://baldis-basics-in-education-and-learning.wikia.com/wiki/Arts_and_Crafters","https://baldis-basics-in-education-and-learning.wikia.com/wiki/Principal_of_the_Thing","https://baldis-basics-in-education-and-learning.wikia.com/wiki/Cloudy_Copter","https://baldis-basics-in-education-and-learning.wikia.com/wiki/Filename2"};
	['JoinLeaveChannel'] = nil;
	['DeletedChannel'] = nil;
}

local phrases = {}
phrasesauthors = {}
client:run(BotSettings.Token)
print("Bot Begin")
client:setGame(BotSettings.DefaultPlay)
client:on('messageCreate', function(message)
	if message.guild then
	i = i + 1
	phrases[i] = message.content
	phrasesauthors[i] = message.author
	--Before
	if creationphase == 2 and message.author.id == creatorauthor then -- creation step 2
	message.channel:send("Command " .. customcommandnames[#customcommandnames] .. " has been created!")
	local length = #customcommandresponses + 1
	customcommandresponses[length] = message.content
	creationphase = 0
	print(customcommandnames[1] .. customcommandresponses[1])
	creatorauthor = nil
	creationdisabled = false
	end
	if creationphase == 1 and message.author.id == creatorauthor then -- creation step 1
	message.channel:send("Ok! What is the response?")
	local length = #customcommandnames + 1
	customcommandnames[length] = message.content 
	creationphase = 2
	customcommandauthors[length] = message.author.username
	end
	if math.random(1,6) == 1 then
	message:addReaction(BotSettings.Emoji[math.random(1,#BotSettings.Emoji)])
	end
	--print(message.member.status)
	if message.content:sub(1,2) == BotSettings.Prefix then
		print("Recieved Command " .. '"' .. message.content .. '"')
		if message.content:sub(3,string.len(message.content)) == "despacito" then -- The b.despacito command
			message.channel:send("NO PLAYING DESPACITO IN THE HALLS")
		end
		if message.content:sub(3,string.len(message.content)) == "phrase" then -- The b.phrase
			local num = math.random(1,#phrases)
			message.channel:send('"' .. phrases[num] .. '" by ' .. phrasesauthors[num].username)
		end
		if message.content:sub(3,string.len(message.content)) == "baldipedia" then -- The b.baldipedia
			local num = math.random(1,#BotSettings.Baldipedia)
			message.channel:send(BotSettings.Baldipedia[num])
		end
		if message.content:sub(3,string.len(message.content)) == "someone" then -- The b.someone
			local num = math.random(1,#phrases)
			message.channel:send("<@!"..phrasesauthors[math.random(1,#phrasesauthors)].id .. ">")
		end
		if message.content:sub(3,string.len(message.content)) == "help" then -- The b.help
			local stringz = ""
			if #customcommandnames ~= 0 then
			for j=1, #customcommandnames do
				stringz = stringz .. "\nb." .. customcommandnames[j] .. " - by " .. customcommandauthors[j]
			end
			end
			print(stringz)
			message.channel:send("```--Official Commands--\nb.someone - Ping a random user\nb.phrase - A random message from the server\nb.despacito - no.\nb.math - NOW ITS TIME FOR EVERYONES FAVORITE SUBJECT! MATH\nb.baldipedia - A link to a random baldipedia page.\nb.createcmd - Create your own command!\nb.stats - See the current server stats!\n--Custom Commands--" .. stringz .."\n--Owner Commands--\nb.setjoinchannel - Sets the joins/leaves channel.\nb.setdeletechannel - Sets the deleted messages channel.\nb.exit - Terminates the Lua Script running Baldi-Bot.```")
		end
		if message.content:sub(3,string.len(message.content)) == "math" then -- The b.math
			local num1 = math.random(0,10)
			local num2 = math.random(0,10)
			local impossibleproblem = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890!@#$%^&*(){}<>"
			local strings = {"Aha, you got it!","Great job! That's right!","Good one!","You're doing fantastic!","I can't believe it... you're incredible!"}
			local op = math.random(1,3)
			if op == 1 then
			message.channel:send(num1 .. " + " .. num2 .. " = " .. (num1 + num2))
			message.channel:send("Baldi: " .. strings[math.random(1,#strings)])
			else
			if op == 2 then
			message.channel:send(num1 .. " - " .. num2 .. " = " .. (num1 - num2))
			message.channel:send("Baldi: " .. strings[math.random(1,#strings)])
			else
			local num = math.random(1,string.len(impossibleproblem))
			local nanv11 = impossibleproblem:sub(num,num)
			local num = math.random(1,string.len(impossibleproblem))
			local nanv12 = impossibleproblem:sub(num,num)
			local num = math.random(1,string.len(impossibleproblem))
			local nanv13 = impossibleproblem:sub(num,num)
			local num = math.random(1,string.len(impossibleproblem))
			local nanv21 = impossibleproblem:sub(num,num)
			local num = math.random(1,string.len(impossibleproblem))
			local nanv22 = impossibleproblem:sub(num,num)
			local num = math.random(1,string.len(impossibleproblem))
			local nanv23 = impossibleproblem:sub(num,num)
			local nan1 = nanv11 .. nanv12 .. nanv13
			local nan2 = nanv21 .. nanv22 .. nanv23
			message.channel:send(nan1 .. " + " .. nan2 .. " = " .. math.random(-100,100))
			message.channel:send("Baldi: ...")
			end
			end
		end
		if message.content:sub(3,string.len(message.content)) == "baldi" then -- The b.baldi
			local short = message.author.username:sub(1,3)
			print("processing baldi")
			print(short)
			baldiname = nil
			print(string.lower(short:sub(3,3)) == "a" or string.lower(short:sub(3,3)) == "e" or string.lower(short:sub(3,3)) == "i" or string.lower(short:sub(3,3)) == "o" or string.lower(short:sub(3,3)) == "u")
			if string.lower(short:sub(3,3)) == "a" or string.lower(short:sub(3,3)) == "e" or string.lower(short:sub(3,3)) == "i" or string.lower(short:sub(3,3)) == "o" or string.lower(short:sub(3,3)) == "u" then
			baldiname = short .. "ldi"
			print(short .. "ldi")
			else
			baldiname = short .. "di"
			print(short .. "di")
			end
			print(baldiname)
			message.member:setNickname(baldiname)
			message.channel:send("👏Your new name is `" .. baldiname .. "`!")
		end
		if message.content:sub(3,string.len(message.content)) == "createcmd" then -- The b.createcmd
			if creationdisabled == false then
				print("Creation started")
				creationphase = 1
				creatorauthor = message.author.id
				creationdisabled = true
				message.channel:send("Command creation started!")
				message.channel:send("What is the name of the command?")
			end
		end
		if message.content:sub(3,string.len(message.content)) == "stats" then -- The b.stats
			message.channel:send("``` --Curruent stats of the server--\n" .. #message.guild.members .. " members.\n" .. #message.guild.emojis .. " emojis.\nCurrent invite: https://discord.gg/NJDnUuE```")
		end
	for j=1, #customcommandnames do
	if message.content:sub(3,string.len(message.content)) == customcommandnames[j] then -- The b.despacito command
			message.channel:send(customcommandresponses[j])
		end
	end
	end
	if message.member.status == "offline" then
	message.author:getPrivateChannel():send("Hey! You can't send messages while invisible! Get off of invisible mode in order to chat! But hey! Just to calm you down, have a random message sent on the server.")
	local num = math.random(1,#phrases)
	message.author:getPrivateChannel():send('"' .. phrases[num] .. '" by ' .. phrasesauthors[num].username)
	message:delete()
	end
	else
	if message.content == "fuck" or message.content == "nigger" or message.content == "bitch" or message.content == "faggot" or message.content == "shit" then
	local madphrase = {"😡","HEY! THATS MEAN!","DONT DO THAT PLZ.","😡😡😡😡😡","That is not nice! 😡"}
	message.channel:send(madphrase[math.random(1,#madphrase)])
	end
	end
end)


client:on('messageCreate', function(message) --Ben_The_Gaben Only Commands
	if message.content == BotSettings.TerminateCommand and message.author.username == "Ben_The_Gaben" then
		message.channel:send('Terminating...')
		os.exit()
	end
	if message.content == "b.setjoinchannel" and message.author.username == "Ben_The_Gaben" then
		BotSettings.JoinLeaveChannel = message.channel
		message.author:getPrivateChannel():send("DEV:" .. message.channel.id)
		message.channel:send('Set Succesfully!')
	end
	if message.content == "b.setdeletechannel" and message.author.username == "Ben_The_Gaben" then
		BotSettings.DeletedChannel = message.channel
		message.author:getPrivateChannel():send("DEV:" .. message.channel.id)
		message.channel:send('Set Succesfully!')
	end
	if message.content == "b.deletecustoms" and message.author.username == "Ben_The_Gaben" then
		customcommandnames = {}
		customcommandresponses = {}
		customcommandauthors = {}
		message.channel:send('Custom Commands Deleted Succesfully!')
	end
	if message.content:sub(1,6) == "b.say " and message.author.username == "Ben_The_Gaben" then
		message.channel:send(message.content:sub(6,string.len(message.content)))
		message:delete()
	end
	if message.content:sub(1,15) == "b.deletecustom " and message.author.username == "Ben_The_Gaben" then
		local num = tonumber(message.content:sub(15,string.len(message.content)))
		customcommandnames[num] = nil
		customcommandresponses[num] = nil
		customcommandauthors[num] = nil
	end
end)

client:on('memberJoin', function(member)
	if BotSettings.JoinLeaveChannel ~= nil then
	player = member.user.id
	local emoji = BotSettings.Emoji[math.random(1,#BotSettings.Emoji)]
	local joinmessages = {"Oh Hi, <@!" .. player ..">! Welcome to our schoolhouse!","<@!" .. player .. "> has joined our schoolhouse!","Wow! <@!" .. player .."> exists!"}
	BotSettings.JoinLeaveChannel:send(emoji .. joinmessages[math.random(1,#joinmessages)] .. emoji)
	else
	print("ERROR. BotSettings.JoinLeaveChannel IS STILL NIL.")
	end

end)

client:on('memberLeave', function(member)
	if BotSettings.JoinLeaveChannel ~= nil then
	player = member.name
	local emoji = BotSettings.Emoji[math.random(1,#BotSettings.Emoji)]
	local leavemessages = {"Oh... Bye " .. player ..". Hope you had fun in our schoolhouse.",player .. " has graduated...","See you soon, " .. player .."."}
	BotSettings.JoinLeaveChannel:send(emoji .. leavemessages[math.random(1,#leavemessages)] .. emoji)
	else
	print("ERROR. BotSettings.JoinLeaveChannel is still nil.")
	end

end)

client:on('messageDelete', function(message)
	if BotSettings.DeletedChannel ~= nil then
	BotSettings.DeletedChannel:send('"' .. message.content .. '" by <@!' .. message.author.id .. ">")
	else
	print("ERROR. BotSettings.DeletedChannel is still nil.")
	end

end)

