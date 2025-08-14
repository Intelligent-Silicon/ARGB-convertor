  MEMBER('ARGB.clw')

  PRAGMA('define(init_priority=>3)')

  MAP
    MODULE('ARGBBC0.CLW')
ARGBBC0:DctInit             PROCEDURE
ARGBBC0:DctKill             PROCEDURE
ARGBBC0:FilesInit           PROCEDURE
    END
  END

DctInit PROCEDURE
  CODE
  ARGBBC0:DctInit
  ARGBBC0:FilesInit


DctKill PROCEDURE
  CODE
  ARGBBC0:DctKill

