class wordpress::config wordpress {
exec { "downloadwordpress" :
                   command => "wget https://wordpress.org/latest.zip && touch /tmp/fil4",
                   path => "/usr/bin",
                   cwd => "/var",
                   creates => "/tmp/fil4",
 }
exec { "unzipwordpress" :
            command => "unzip /var/latest.zip && touch /tmp/file5",
            path => "/usr/bin",
            creates => "/tmp/file5",
            cwd => "/var",
            require => "downloadwordpress",
}
exec { "copywordpress" :
                  command => "cp -R /var/wordpress/* /var/www/html && touch /tmp/file6",
                  path => "/bin",
                  creates => "/tmp/file6",
                  require => "unzipwordpress",
}
exec { "configurewordpress" :
               command => "wget https://raw.githubusercontent.com/roybhaskar9/chefwordpress-1/master/wordpress/files/default/wp-config-sample.php -O wp-config.php && touch /tmp/file7",
               path => "/usr/bin",
               cwd => "/var/www/html",
               require => "copywordpress",
}
}
