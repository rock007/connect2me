connect2me
=====

An OTP application

cowboy - 一个小巧，高效的HTTP服务器，
bullet - 一个cowboy用到的小巧，高效，稳定的类似WebSockets的协议库.
ranch - cowboy用到的TCP网络库.
lager - 一个Erlang/OTP日志框架.
jsx - 完全用erlang编写的json解析库.

Build
-----

    $ rebar3 compile



{erl_opts, [debug_info]}.
{deps, [
	{cowboy, {git, "git://github.com/ninenines/cowboy.git", {tag, "1.0.4"}}},
	{lager, {git, "git://github.com/basho/lager.git", {tag, "3.2.4"}}},
  {jsx, {git, "https://github.com/talentdeficit/jsx.git", {branch, "v2.8.0"}}}
]}.

{relx, [{release, { connect2me, "0.1.0" },
         [connect2me,
          sasl]},

        {sys_config, "./config/sys.config"},
        {vm_args, "./config/vm.args"},

        {dev_mode, true},
        {include_erts, false},

        {extended_start_script, true}]
}.

{profiles, [{prod, [{relx, [{dev_mode, false},
                            {include_erts, true}]}]
            }]
}.
