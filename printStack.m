function printStack()
global logger

if isempty(logger)
    printcmd = 'fprintf';
elseif isa(logger, 'Logger')
    if ~logger.IsOpen()
        printcmd = 'fprintf';
    else
        printcmd = 'logger.WriteFmt';
    end
else
    printcmd = 'logger.WriteFmt';
end

eval( sprintf('%s(''-----------------\\n'')', printcmd) );
eval( sprintf('%s(''Error call stack:\\n'')', printcmd) );
eval( sprintf('%s(''-----------------\\n'')', printcmd) );
s = dbstack;
for ii = 2:length(s)
    eval( sprintf('%s(''In %%s > %%s, (line %%d)\\n'', s(ii).file, s(ii).name, s(ii).line)', printcmd) );
end
eval( sprintf('%s(''\\n\\n'')', printcmd) );
