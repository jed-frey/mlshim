%% Automatically Generated Run Script
{% for header, value in obj.headers.items() %}
% {{ header }}: {{ value }} 
{% endfor %}

try
    fprintf('########## Started ##########\n');
{% if cwd is not none %}
    cd('{{ obj.working_directory }}');
{% endif %}

{%- for path in paths %}
    add('{{ path }}');
{% endfor %}

{%- for datafile in datafiles %}
    load('{{ datafile }}');
{% endfor %}

{%- for script in scripts %}
    {{ script }}
{% endfor %}
catch me
    fprintf('########## Failed ##########\n');
    fprintf('ERROR: %s (%s)\n\n',me.message, me.identifier)
    for i = numel(me.stack):-1:1
        fprintf('[Line %02d]: %s\n',me.stack(i).line,me.stack(i).file)
    end
    exit(1);
end
fprintf('########## Finished ##########\n');
exit(0);