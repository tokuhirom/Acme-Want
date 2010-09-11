use inc::Module::Install;
name 'Acme-Want';
all_from 'lib/Acme/Want.pm';

# requires '';


readme_markdown_from 'lib/Acme/Want.pm';
tests 't/*.t t/*/*.t t/*/*/*.t t/*/*/*/*.t';
test_requires 'Test::More';
test_requires 'YAML';
author_tests('xt');
# use_test_base;
auto_include;
WriteAll;
