/*
 *  Sets READ_COMMITTED_SNaPSHOT ON the specified Intelligent Viewing (IV) database.
 *  Replace 'YourDatabaseNameHere' with the name of the IV database.
 *
 *  IMPORTANT: No other database sessions can be connected while the following
 *   SQL commands execute. Close all other db sessions prior to  executing these statements.
 *
 *  If there's an existing IV kubernetes deployment connected to this database,
 *    scale down the pods that connect to the database, e.g.:
 *  kubectl scale --replicas deploy otiv-markup otiv-config otiv-publication otiv-publisher
 *
 *  After the sql command has succussfully executed, perform a helm upgrade or
 *    execute a kubectl command to scaled these pods back up to their original replica count.
 */

DECLARE @ivDatabase NVARCHAR(128) = N'YourDatabaseNameHere';

EXEC('ALTER DATABASE [' + @ivDatabase + '] SET SINGLE_USER WITH ROLLBACK IMMEDIATE;');
EXEC('ALTER DATABASE [' + @ivDatabase + '] SET READ_COMMITTED_SNAPSHOT ON;');
EXEC('ALTER DATABASE [' + @ivDatabase + '] SET MULTI_USER;');

