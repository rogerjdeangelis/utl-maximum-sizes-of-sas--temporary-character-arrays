Maximum sizes of sas temporary character arrays ( 38,347,922 Elements ~2**25 )                                                          
                                                                                                                                        
github                                                                                                                                  
https://tinyurl.com/yawxgk3f                                                                                                            
https://github.com/rogerjdeangelis/utl-maximum-sizes-of-sas--temporary-character-arrays                                                 
                                                                                                                                        
Non-temporary arrays are limited to 32,756 elements?                                                                                    
                                                                                                                                        
As far as I can tell R matrix element size is 2,147,483,647  2**(32-1)                                                                  
                                                                                                                                        
github                                                                                                                                  
https://tinyurl.com/y8x5r9ey                                                                                                            
https://github.com/rogerjdeangelis/utl-maximum-size-of-sas-array-of-eight-byte-floats                                                   
                                                                                                                                        
*_                   _                                                                                                                  
(_)_ __  _ __  _   _| |_                                                                                                                
| | '_ \| '_ \| | | | __|                                                                                                               
| | | | | |_) | |_| | |_                                                                                                                
|_|_| |_| .__/ \__,_|\__|                                                                                                               
        |_|                                                                                                                             
;                                                                                                                                       
                                                                                                                                        
SAS Workstation SAS9.4M6 64bit and Win10 64bit                                                                                          
                                                                                                                                        
I have 128gb ram                                                                                                                        
                                                                                                                                        
MEMMAXSZ    = 128,849,018,880 Specifies the maximum amount of memory to allocate for using memory-based libraries.                      
MEMSIZ      = 128,849,018,880 Specifies the limit on the amount of virtual memory that can be used during a SAS session.                
REALMEMSIZE = 128,849,018,880 Specifies the amount of real memory SAS can expect to allocate.                                           
                                                                                                                                        
*                           _                                                                                                           
 _ __ ___   __ ___  __  ___(_)_______  ___                                                                                              
| '_ ` _ \ / _` \ \/ / / __| |_  / _ \/ __|                                                                                             
| | | | | | (_| |>  <  \__ \ |/ /  __/\__ \                                                                                             
|_| |_| |_|\__,_/_/\_\ |___/_/___\___||___/                                                                                             
                                                                                                                                        
;                                                                                                                                       
                                                                                                                                        
Max sizes                                                                                                                               
==========                                                                                                                              
                                                                                                                                        
array ary[38347922] $ 56 _temporary_;                                                                                                   
                                                                                                                                        
38,347,922            MAX number of Elements ~2**25                                                                                     
 56 bytes             Max element size= 38,347,922 * 56                                                                                 
2,147,483,648 bytes   Max array mrmory  2**31 =  2,147,483,648 bytes =  56 * 38,347,922;                                                
                                                                                                                                        
                                                                                                                                        
SOAPBOX ON                                                                                                                              
                                                                                                                                        
SAS may enforce these limits so programs will in virtual machines on EG servers.                                                        
It seems rare for EG virtual machines to have more that 4gb fake memory and 2 fake cores.                                               
Even worse on the cloud with over-provisioned fake memory, exreeme latency, fake cores and very slow disk access.                       
                                                                                                                                        
SOAPBOX OFF                                                                                                                             
                                                                                                                                        
                                                                                                                                        
*                                                                                                                                       
 _ __  _ __ ___   ___ ___  ___ ___                                                                                                      
| '_ \| '__/ _ \ / __/ _ \/ __/ __|                                                                                                     
| |_) | | | (_) | (_|  __/\__ \__ \                                                                                                     
| .__/|_|  \___/ \___\___||___/___/                                                                                                     
|_|                                                                                                                                     
;                                                                                                                                       
                                                                                                                                        
/*                                                                                                                                      
  38,347,922  Fits in the enforced SAS limits                                                                                           
  38,347,923  Does not fit in memory                                                                                                    
*/                                                                                                                                      
                                                                                                                                        
%macro tst;                                                                                                                             
                                                                                                                                        
  %do i=38347922 %to 38347923 %by 1;                                                                                                    
                                                                                                                                        
    data _null_;                                                                                                                        
                                                                                                                                        
      array gb2[&i] $ 56 _temporary_;                                                                                                   
                                                                                                                                        
      put "&i";                                                                                                                         
                                                                                                                                        
    run;quit;                                                                                                                           
                                                                                                                                        
                                                                                                                                        
                                                                                                                                        
%end;                                                                                                                                   
run;quit;                                                                                                                               
                                                                                                                                        
%mend tst;                                                                                                                              
                                                                                                                                        
%tst;                                                                                                                                   
                                                                                                                                        
38347922                                                                                                                                
NOTE: DATA statement used (Total process time):                                                                                         
      real time           2.78 seconds                                                                                                  
      user cpu time       1.67 seconds                                                                                                  
      system cpu time     1.10 seconds                                                                                                  
      memory              4194640.06k                                                                                                   
      OS Memory           4215296.00k                                                                                                   
      Timestamp           06/07/2020 09:42:55 AM                                                                                        
      Step Count                        752  Switch Count  0                                                                            
                                                                                                                                        
                                                                                                                                        
MPRINT(TST):  quit;                                                                                                                     
MLOGIC(TST):  %DO loop index variable I is now 38347923; loop will iterate again.                                                       
MPRINT(TST):   data _null_;                                                                                                             
SYMBOLGEN:  Macro variable I resolves to 38347923                                                                                       
MPRINT(TST):   array gb2[38347923] $ 56 _temporary_;                                                                                    
FATAL: Insufficient memory to execute DATA step program. Aborted during the COMPILATION phase.                                          
ERROR: The SAS System stopped processing this step because of insufficient memory.                                                      
NOTE: DATA statement used (Total process time):                                                                                         
      real time           0.00 seconds                                                                                                  
      user cpu time       0.00 seconds                                                                                                  
      system cpu time     0.00 seconds                                                                                                  
      memory              328.31k                                                                                                       
      OS Memory           20984.00k                                                                                                     
      Timestamp           06/07/2020 09:42:55 AM                                                                                        
      Step Count                        753  Switch Count  0                                                                            
                                                                                                                                        
SYMBOLGEN:  Macro variable I resolves to 38347923                                                                                       
MPRINT(TST):   put "38347923";                                                                                                          
MPRINT(TST):   run;                                                                                                                     
MPRINT(TST):  quit;                                                                                                                     
MLOGIC(TST):  %DO loop index variable I is now 38347924; loop will not iterate again.                                                   
MPRINT(TST):   run;                                                                                                                     
MPRINT(TST):  quit;                                                                                                                     
MLOGIC(TST):  Ending execution.                                                                                                         
                                                                                                                                        
                                                                                                                                        
