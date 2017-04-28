

file_name_receiver(Socket)->
    {ok,FilenameBinaryPadding}=gen_tcp:recv(Socket,30),
    FilenamePadding=erlang:binary_to_list(FilenameBinaryPadding),
    Filename = string:strip(FilenamePadding,both,$ ),
    file_receiver_loop(Socket,Filename,[]).


    file_receiver_loop(Socket,Filename,Bs)->
    io:format("~nRicezione file in corso~n"),
    case gen_tcp:recv(Socket, 0) of
    {ok, B} ->
        file_receiver_loop(Socket, Filename,[Bs, B]);
    {error, closed} ->
        save_file(Filename,Bs)
end.

save_file(Filename,Bs) ->
    io:format("~nFilename: ~p",[Filename]),
    {ok, Fd} = file:open("../script/"++Filename, write),
    file:write(Fd, Bs),
    file:close(Fd).


%%Permette l'invio di un file specificando host,filename e path assoluto
send_file(Host,Filename,FilePath,Port)->
    {ok, Socket} = gen_tcp:connect(list_to_atom(Hostname), Port,          TCP_OPTIONS_CLIENT),
    FilenamePadding = string:left(Filename, 30, $ ), %%Padding with white space
    gen_tcp:send(Socket,FilenamePadding),
    Ret=file:sendfile(FilePath, Socket),
    ok = gen_tcp:close(Socket).