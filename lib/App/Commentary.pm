package App::Commentary;

use strict;
use warnings;

# ABSTRACT: Add comments to static websites

# VERSION

use Dancer ':syntax';
use Dancer::Plugin::Commentary;

get '/' => sub {
    # TODO: We may want to make this configurable, in case some static site 
    # generator doesn't do index.html
    forward '/index.html';
};

get '/app-commentary/assets/**' => sub {
    my ($path) = splat;

    return send_file(path(qw( .. App-Commentary share assets ), @$path),
        system_path => 1);
};

true;
