


### Как запустить тесты?
```
export PERL5LIB=lib:local/lib/perl5
prove -v --timer t/
```

### Структура:
```
├── bin                 # разрабатываемые скрипты
│   └── myscript.pl
├── lib                 # разрабатываемые модули
│   └── MyModule.pm
├── cpanfile            # файлик с описанием зависимостей
├── local               # внешние зависимости
│   ├── bin
│   ├── lib
│   └── man
├── README.md
└── t                       # тесты
    ├── 00_compile.t        # проверка компилябельности
    ├── 00_perlcritic.t     # проверка perlcritic'ом
    ├── lib                 # тесты для Test::Class::Moose (tcm.t)
    └── tcm.t
```


### Чеклист:

#### Coro::Debug

```
perl bin/corodbg_demo.pl
socat readline unix:/tmp/corodbd.sock
```

#### Можно запускать только опеределенные тест-классы и методы
```
prove -v --timer t/tcm.t :: --classes Game::Test --methods test_register_user
```

#### Можно посмотреть только вывод TAP
```
prove -v --timer t/tcm.t 2>/dev/null
```

#### Можно посмотреть coverage

(но это долго ждать, пока сгенерится отчет)
```
➜  technoperl-async git:(tests) ✗ PERL5OPT="$PERL5OPT -MDevel::Cover" prove -Ilib t
t/00_compile.t ..... ok
t/00_perlcritic.t .. 1/?
#   Failed test 'Test::Perl::Critic for "lib/Game.pm"'
#   at local/lib/perl5/Test/Perl/Critic.pm line 121.
#
#   [Moose::RequireMakeImmutable] No call was made to make_immutable() at lib/Game.pm:1 near 'package Game;'.  (Severity: 4)
t/00_perlcritic.t .. Dubious, test returned 1 (wstat 256, 0x100)
Failed 1/4 subtests
t/tcm.t ............ Can't init game: 1 at t/lib/Game/Test.pm line 17.
t/tcm.t ............ 1/1     # test_game_init: 0.00288701 wallclock secs ( 0.00 usr +  0.00 sys =  0.00 CPU)
    # test_register_user: 0.0031662 wallclock secs ( 0.01 usr +  0.00 sys =  0.01 CPU)
    # Game::Test: 0.018939 wallclock secs ( 0.02 usr +  0.00 sys =  0.02 CPU)
# Test classes:    1
# Test instances:  1
# Test methods:    2
# Total tests run: 3
t/tcm.t ............ ok

Test Summary Report
-------------------
t/00_perlcritic.t (Wstat: 256 Tests: 4 Failed: 1)
  Failed test:  3
  Non-zero exit status: 1
Files=3, Tests=9, 123 wallclock secs ( 0.03 usr  0.01 sys + 463.92 cusr  5.75 csys = 469.71 CPU)
Result: FAIL
Time: 0h:02m:03s
```

и генерим отчет
```
./local/bin/cover -report html_basic
...

HTML output written to /home/d.tarasov/workspace/mail/technoperl-atom-2020-2/technoperl-async/cover_db/coverage.html
Time: 0h:02m:49s
```

#### Можно строить отчеты, если тестов много

https://demo.qameta.io/allure/#


#### Что дальше?
#### Можем написать crawler?
