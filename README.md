


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

# todo



