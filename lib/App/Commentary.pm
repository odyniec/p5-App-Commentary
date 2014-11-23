package App::Commentary;

use strict;
use warnings;

# ABSTRACT: Add comments to static websites

# VERSION

use Dancer ':syntax';
use Dancer::Plugin::Commentary;
use File::ShareDir;

my $dist_dir = File::ShareDir::dist_dir('App-Commentary');
my $assets_dir = path $dist_dir, 'assets';

get '/' => sub {
    # TODO: We may want to make this configurable, in case some static site 
    # generator doesn't do index.html
    forward '/index.html';
};

get '/app-commentary/assets/**' => sub {
    my ($path) = splat;

    return send_file(path($assets_dir, @$path), system_path => 1);
};

true;
