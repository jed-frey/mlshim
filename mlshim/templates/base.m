%% Automatically Generated Run Script
{% for header, value in headers.items() %}
% {{ header }}: {{ value }}
{% endfor %}

try
    fprintf('########## Started ##########\n');

{% block body %}
cd('{{ obj.start_directory }}');

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
    quit('force');
end
fprintf('########## Finished ##########\n');
quit('force');
