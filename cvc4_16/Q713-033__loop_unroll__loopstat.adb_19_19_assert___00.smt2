(set-info :smt-lib-version 2.6)
(set-logic AUFBVFPDTNIRA)
(set-info :source |
Generated by: AdaCore
Generated on: 2020-03-06
Generator: SPARK
Application: Program verification for Ada
Target solver: CVC4
|)
(set-info :license "https://creativecommons.org/licenses/by/4.0/")
(set-info :category "industrial")
(set-info :status unknown)
;;; generated by SMT-LIB2 driver
;;; SMT-LIB2 driver: bit-vectors, common part
;;; SMT-LIB2: integer arithmetic
(declare-sort string 0)

(declare-datatypes ((tuple0 0))
(((Tuple0))))
(declare-sort us_private 0)

(declare-fun private__bool_eq (us_private us_private) Bool)

(declare-const us_null_ext__ us_private)

(declare-sort us_type_of_heap 0)

(declare-datatypes ((us_type_of_heap__ref 0))
(((us_type_of_heap__refqtmk (us_type_of_heap__content us_type_of_heap)))))
(declare-sort us_image 0)

(declare-datatypes ((int__ref 0))
(((int__refqtmk (int__content Int)))))
(declare-datatypes ((bool__ref 0))
(((bool__refqtmk (bool__content Bool)))))
(declare-datatypes ((us_fixed__ref 0))
(((us_fixed__refqtmk (us_fixed__content Int)))))
(declare-datatypes ((real__ref 0))
(((real__refqtmk (real__content Real)))))
(declare-datatypes ((us_private__ref 0))
(((us_private__refqtmk (us_private__content us_private)))))
(define-fun int__ref___projection ((a int__ref)) Int (int__content a))

(define-fun us_fixed__ref___projection ((a us_fixed__ref)) Int (us_fixed__content
                                                               a))

(define-fun bool__ref___projection ((a bool__ref)) Bool (bool__content a))

(define-fun real__ref___projection ((a real__ref)) Real (real__content a))

(define-fun us_private__ref___projection ((a us_private__ref)) us_private 
  (us_private__content a))

(define-fun in_range ((x Int)) Bool (or (= x 0) (= x 1)))

(declare-fun attr__ATTRIBUTE_IMAGE (Bool) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE (us_image) Bool)

(declare-sort integer 0)

(declare-fun integerqtint (integer) Int)

;; integer'axiom
  (assert
  (forall ((i integer))
  (and (<= (- 2147483648) (integerqtint i)) (<= (integerqtint i) 2147483647))))

(define-fun in_range1 ((x Int)) Bool (and (<= (- 2147483648) x)
                                     (<= x 2147483647)))

(declare-fun attr__ATTRIBUTE_IMAGE1 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check1 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE1 (us_image) Int)

(declare-fun user_eq (integer integer) Bool)

(declare-const dummy integer)

(declare-datatypes ((integer__ref 0))
(((integer__refqtmk (integer__content integer)))))
(define-fun integer__ref_integer__content__projection ((a integer__ref)) integer 
  (integer__content a))

(define-fun dynamic_invariant ((temp___expr_18 Int) (temp___is_init_14 Bool)
  (temp___skip_constant_15 Bool) (temp___do_toplevel_16 Bool)
  (temp___do_typ_inv_17 Bool)) Bool (=>
                                    (or (= temp___is_init_14 true)
                                    (<= (- 2147483648) 2147483647))
                                    (in_range1 temp___expr_18)))

(define-fun to_rep ((x integer)) Int (integerqtint x))

(declare-fun of_rep (Int) integer)

;; inversion_axiom
  (assert
  (forall ((x integer)) (! (= (of_rep (to_rep x)) x) :pattern ((to_rep x)) )))

;; range_axiom
  (assert
  (forall ((x integer)) (! (in_range1 (to_rep x)) :pattern ((to_rep x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range1 x) (= (to_rep (of_rep x)) x)) :pattern ((to_rep
                                                            (of_rep x))) )))

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(declare-datatypes ((map__ref 0))
(((map__refqtmk (map__content (Array Int integer))))))
(declare-fun slide ((Array Int integer) Int Int) (Array Int integer))

;; slide_eq
  (assert
  (forall ((a (Array Int integer)))
  (forall ((first Int))
  (! (= (slide a first first) a) :pattern ((slide a first first)) ))))

;; slide_def
  (assert
  (forall ((a (Array Int integer)))
  (forall ((old_first Int))
  (forall ((new_first Int))
  (forall ((i Int))
  (! (= (select (slide a old_first new_first) i) (select a (- i (- new_first old_first)))) :pattern ((select 
  (slide a old_first new_first) i)) ))))))

(define-fun bool_eq ((a (Array Int integer)) (a__first Int) (a__last Int)
  (b (Array Int integer)) (b__first Int)
  (b__last Int)) Bool (ite (and
                           (ite (<= a__first a__last)
                           (and (<= b__first b__last)
                           (= (- a__last a__first) (- b__last b__first)))
                           (< b__last b__first))
                           (forall ((temp___idx_154 Int))
                           (=>
                           (and (<= a__first temp___idx_154)
                           (<= temp___idx_154 a__last))
                           (= (to_rep (select a temp___idx_154)) (to_rep
                                                                 (select b (+ (- b__first a__first) temp___idx_154)))))))
                      true false))

;; bool_eq_rev
  (assert
  (forall ((a (Array Int integer)) (b (Array Int integer)))
  (forall ((a__first Int) (a__last Int) (b__first Int) (b__last Int))
  (=> (= (bool_eq b b__first b__last a a__first a__last) true)
  (and
  (ite (<= a__first a__last)
  (and (<= b__first b__last) (= (- a__last a__first) (- b__last b__first)))
  (< b__last b__first))
  (forall ((temp___idx_154 Int))
  (=> (and (<= a__first temp___idx_154) (<= temp___idx_154 a__last))
  (= (to_rep (select a temp___idx_154)) (to_rep
                                        (select b (+ (- b__first a__first) temp___idx_154)))))))))))

(declare-const attr__ATTRIBUTE_ADDRESS1 Int)

(declare-const attr__ATTRIBUTE_ADDRESS2 Int)

(declare-const attr__ATTRIBUTE_ADDRESS3 Int)

(declare-const attr__ATTRIBUTE_ADDRESS4 Int)

(declare-const attr__ATTRIBUTE_ADDRESS5 Int)

(assert
;; defqtvc
 ;; File "loopstat.adb", line 1, characters 0-0
  (not
  (forall ((k Int) (k1 Int))
  (=> (dynamic_invariant k false false true true)
  (=> (= k1 0)
  (let ((o (+ k1 1)))
  (=> (in_range1 o)
  (forall ((k2 Int))
  (=> (= k2 o)
  (let ((o1 (+ k2 1)))
  (=> (in_range1 o1)
  (forall ((k3 Int))
  (=> (= k3 o1)
  (let ((o2 (+ k3 1)))
  (=> (in_range1 o2)
  (forall ((k4 Int))
  (=> (= k4 o2)
  (let ((o3 (+ k4 1)))
  (=> (in_range1 o3)
  (forall ((k5 Int))
  (=> (= k5 o3)
  (let ((o4 (+ k5 1)))
  (=> (in_range1 o4)
  (forall ((k6 Int))
  (=> (= k6 o4)
  (let ((o5 (+ k6 1)))
  (=> (in_range1 o5)
  (forall ((k7 Int))
  (=> (= k7 o5)
  (let ((o6 (+ k7 1)))
  (=> (in_range1 o6)
  (forall ((k8 Int))
  (=> (= k8 o6)
  (let ((o7 (+ k8 1)))
  (=> (in_range1 o7)
  (forall ((k9 Int))
  (=> (= k9 o7)
  (let ((o8 (+ k9 1)))
  (=> (in_range1 o8)
  (forall ((k10 Int))
  (=> (= k10 o8)
  (let ((o9 (+ k10 1)))
  (=> (in_range1 o9)
  (forall ((k11 Int))
  (=> (= k11 o9)
  (=> (= k11 10)
  (forall ((k12 Int))
  (=> (= k12 0)
  (let ((o10 (+ k12 1)))
  (=> (in_range1 o10)
  (forall ((k13 Int))
  (=> (= k13 o10)
  (let ((o11 (+ k13 1)))
  (=> (in_range1 o11)
  (forall ((k14 Int))
  (=> (= k14 o11)
  (let ((o12 (+ k14 1)))
  (=> (in_range1 o12)
  (forall ((k15 Int))
  (=> (= k15 o12)
  (let ((o13 (+ k15 1)))
  (=> (in_range1 o13)
  (forall ((k16 Int))
  (=> (= k16 o13)
  (let ((o14 (+ k16 1)))
  (=> (in_range1 o14)
  (forall ((k17 Int))
  (=> (= k17 o14)
  (let ((o15 (+ k17 1)))
  (=> (in_range1 o15)
  (forall ((k18 Int))
  (=> (= k18 o15)
  (let ((o16 (+ k18 1)))
  (=> (in_range1 o16)
  (forall ((k19 Int))
  (=> (= k19 o16)
  (let ((o17 (+ k19 1)))
  (=> (in_range1 o17)
  (forall ((k20 Int))
  (=> (= k20 o17)
  (let ((o18 (+ k20 1)))
  (=> (in_range1 o18)
  (forall ((k21 Int))
  (=> (= k21 o18)
  (let ((o19 (+ k21 1)))
  (=> (in_range1 o19)
  (forall ((k22 Int))
  (=> (= k22 o19)
  (let ((o20 (+ k22 1)))
  (=> (in_range1 o20)
  (forall ((k23 Int))
  (=> (= k23 o20)
  (let ((o21 (+ k23 1)))
  (=> (in_range1 o21)
  (forall ((k24 Int))
  (=> (= k24 o21)
  (let ((o22 (+ k24 1)))
  (=> (in_range1 o22)
  (forall ((k25 Int))
  (=> (= k25 o22)
  (let ((o23 (+ k25 1)))
  (=> (in_range1 o23)
  (forall ((k26 Int))
  (=> (= k26 o23)
  (let ((o24 (+ k26 1)))
  (=> (in_range1 o24)
  (forall ((k27 Int))
  (=> (= k27 o24)
  (let ((o25 (+ k27 1)))
  (=> (in_range1 o25)
  (forall ((k28 Int))
  (=> (= k28 o25)
  (let ((o26 (+ k28 1)))
  (=> (in_range1 o26)
  (forall ((k29 Int))
  (=> (= k29 o26)
  (let ((o27 (+ k29 1)))
  (=> (in_range1 o27)
  (forall ((k30 Int))
  (=> (= k30 o27)
  (let ((o28 (+ k30 1)))
  (=> (in_range1 o28)
  (forall ((k31 Int))
  (=> (= k31 o28)
  (let ((o29 (+ k31 1)))
  (=> (in_range1 o29)
  (forall ((k32 Int))
  (=> (= k32 o29)
  (let ((o30 (+ k32 1)))
  (=> (in_range1 o30)
  (forall ((k33 Int))
  (=> (= k33 o30)
  (let ((o31 (+ k33 1)))
  (=> (in_range1 o31)
  (forall ((k34 Int))
  (=> (= k34 o31)
  (let ((o32 (+ k34 1)))
  (=> (in_range1 o32)
  (forall ((k35 Int))
  (=> (= k35 o32)
  (let ((o33 (+ k35 1)))
  (=> (in_range1 o33)
  (forall ((k36 Int))
  (=> (= k36 o33)
  (let ((o34 (+ k36 1)))
  (=> (in_range1 o34)
  (forall ((k37 Int))
  (=> (= k37 o34)
  (let ((o35 (+ k37 1)))
  (=> (in_range1 o35)
  (forall ((k38 Int))
  (=> (= k38 o35)
  (let ((o36 (+ k38 1)))
  (=> (in_range1 o36)
  (forall ((k39 Int))
  (=> (= k39 o36)
  (let ((o37 (+ k39 1)))
  (=> (in_range1 o37)
  (forall ((k40 Int))
  (=> (= k40 o37)
  (let ((o38 (+ k40 1)))
  (=> (in_range1 o38)
  (forall ((k41 Int))
  (=> (= k41 o38)
  (let ((o39 (+ k41 1)))
  (=> (in_range1 o39)
  (forall ((k42 Int))
  (=> (= k42 o39)
  (let ((o40 (+ k42 1)))
  (=> (in_range1 o40)
  (forall ((k43 Int))
  (=> (= k43 o40)
  (let ((o41 (+ k43 1)))
  (=> (in_range1 o41)
  (forall ((k44 Int))
  (=> (= k44 o41)
  (let ((o42 (+ k44 1)))
  (=> (in_range1 o42)
  (forall ((k45 Int))
  (=> (= k45 o42)
  (let ((o43 (+ k45 1)))
  (=> (in_range1 o43)
  (forall ((k46 Int))
  (=> (= k46 o43)
  (let ((o44 (+ k46 1)))
  (=> (in_range1 o44)
  (forall ((k47 Int))
  (=> (= k47 o44)
  (let ((o45 (+ k47 1)))
  (=> (in_range1 o45)
  (forall ((k48 Int))
  (=> (= k48 o45)
  (let ((o46 (+ k48 1)))
  (=> (in_range1 o46)
  (forall ((k49 Int))
  (=> (= k49 o46)
  (let ((o47 (+ k49 1)))
  (=> (in_range1 o47)
  (forall ((k50 Int))
  (=> (= k50 o47)
  (let ((o48 (+ k50 1)))
  (=> (in_range1 o48)
  (forall ((k51 Int))
  (=> (= k51 o48)
  (let ((o49 (+ k51 1)))
  (=> (in_range1 o49)
  (forall ((k52 Int))
  (=> (= k52 o49)
  (let ((o50 (+ k52 1)))
  (=> (in_range1 o50)
  (forall ((k53 Int))
  (=> (= k53 o50)
  (let ((o51 (+ k53 1)))
  (=> (in_range1 o51)
  (forall ((k54 Int))
  (=> (= k54 o51)
  (let ((o52 (+ k54 1)))
  (=> (in_range1 o52)
  (forall ((k55 Int))
  (=> (= k55 o52)
  (let ((o53 (+ k55 1)))
  (=> (in_range1 o53)
  (forall ((k56 Int))
  (=> (= k56 o53)
  (let ((o54 (+ k56 1)))
  (=> (in_range1 o54)
  (forall ((k57 Int))
  (=> (= k57 o54)
  (let ((o55 (+ k57 1)))
  (=> (in_range1 o55)
  (forall ((k58 Int))
  (=> (= k58 o55)
  (let ((o56 (+ k58 1)))
  (=> (in_range1 o56)
  (forall ((k59 Int))
  (=> (= k59 o56)
  (let ((o57 (+ k59 1)))
  (=> (in_range1 o57)
  (forall ((k60 Int))
  (=> (= k60 o57)
  (let ((o58 (+ k60 1)))
  (=> (in_range1 o58)
  (forall ((k61 Int))
  (=> (= k61 o58)
  (let ((o59 (+ k61 1)))
  (=> (in_range1 o59)
  (forall ((k62 Int))
  (=> (= k62 o59)
  (let ((o60 (+ k62 1)))
  (=> (in_range1 o60)
  (forall ((k63 Int))
  (=> (= k63 o60)
  (let ((o61 (+ k63 1)))
  (=> (in_range1 o61)
  (forall ((k64 Int))
  (=> (= k64 o61)
  (let ((o62 (+ k64 1)))
  (=> (in_range1 o62)
  (forall ((k65 Int))
  (=> (= k65 o62)
  (let ((o63 (+ k65 1)))
  (=> (in_range1 o63)
  (forall ((k66 Int))
  (=> (= k66 o63)
  (let ((o64 (+ k66 1)))
  (=> (in_range1 o64)
  (forall ((k67 Int))
  (=> (= k67 o64)
  (let ((o65 (+ k67 1)))
  (=> (in_range1 o65)
  (forall ((k68 Int))
  (=> (= k68 o65)
  (let ((o66 (+ k68 1)))
  (=> (in_range1 o66)
  (forall ((k69 Int))
  (=> (= k69 o66)
  (let ((o67 (+ k69 1)))
  (=> (in_range1 o67)
  (forall ((k70 Int))
  (=> (= k70 o67)
  (let ((o68 (+ k70 1)))
  (=> (in_range1 o68)
  (forall ((k71 Int))
  (=> (= k71 o68)
  (let ((o69 (+ k71 1)))
  (=> (in_range1 o69)
  (forall ((k72 Int))
  (=> (= k72 o69)
  (let ((o70 (+ k72 1)))
  (=> (in_range1 o70)
  (forall ((k73 Int))
  (=> (= k73 o70)
  (let ((o71 (+ k73 1)))
  (=> (in_range1 o71)
  (forall ((k74 Int))
  (=> (= k74 o71)
  (let ((o72 (+ k74 1)))
  (=> (in_range1 o72)
  (forall ((k75 Int))
  (=> (= k75 o72)
  (let ((o73 (+ k75 1)))
  (=> (in_range1 o73)
  (forall ((k76 Int))
  (=> (= k76 o73)
  (let ((o74 (+ k76 1)))
  (=> (in_range1 o74)
  (forall ((k77 Int))
  (=> (= k77 o74)
  (let ((o75 (+ k77 1)))
  (=> (in_range1 o75)
  (forall ((k78 Int))
  (=> (= k78 o75)
  (let ((o76 (+ k78 1)))
  (=> (in_range1 o76)
  (forall ((k79 Int))
  (=> (= k79 o76)
  (let ((o77 (+ k79 1)))
  (=> (in_range1 o77)
  (forall ((k80 Int))
  (=> (= k80 o77)
  (let ((o78 (+ k80 1)))
  (=> (in_range1 o78)
  (forall ((k81 Int))
  (=> (= k81 o78)
  (let ((o79 (+ k81 1)))
  (=> (in_range1 o79)
  (forall ((k82 Int))
  (=> (= k82 o79)
  (let ((o80 (+ k82 1)))
  (=> (in_range1 o80)
  (forall ((k83 Int))
  (=> (= k83 o80)
  (let ((o81 (+ k83 1)))
  (=> (in_range1 o81)
  (forall ((k84 Int))
  (=> (= k84 o81)
  (let ((o82 (+ k84 1)))
  (=> (in_range1 o82)
  (forall ((k85 Int))
  (=> (= k85 o82)
  (let ((o83 (+ k85 1)))
  (=> (in_range1 o83)
  (forall ((k86 Int))
  (=> (= k86 o83)
  (let ((o84 (+ k86 1)))
  (=> (in_range1 o84)
  (forall ((k87 Int))
  (=> (= k87 o84)
  (let ((o85 (+ k87 1)))
  (=> (in_range1 o85)
  (forall ((k88 Int))
  (=> (= k88 o85)
  (let ((o86 (+ k88 1)))
  (=> (in_range1 o86)
  (forall ((k89 Int))
  (=> (= k89 o86)
  (let ((o87 (+ k89 1)))
  (=> (in_range1 o87)
  (forall ((k90 Int))
  (=> (= k90 o87)
  (let ((o88 (+ k90 1)))
  (=> (in_range1 o88)
  (forall ((k91 Int))
  (=> (= k91 o88)
  (let ((o89 (+ k91 1)))
  (=> (in_range1 o89)
  (forall ((k92 Int))
  (=> (= k92 o89)
  (let ((o90 (+ k92 1)))
  (=> (in_range1 o90)
  (forall ((k93 Int))
  (=> (= k93 o90)
  (let ((o91 (+ k93 1)))
  (=> (in_range1 o91)
  (forall ((k94 Int))
  (=> (= k94 o91)
  (let ((o92 (+ k94 1)))
  (=> (in_range1 o92)
  (forall ((k95 Int))
  (=> (= k95 o92)
  (let ((o93 (+ k95 1)))
  (=> (in_range1 o93)
  (forall ((k96 Int))
  (=> (= k96 o93)
  (let ((o94 (+ k96 1)))
  (=> (in_range1 o94)
  (forall ((k97 Int))
  (=> (= k97 o94)
  (let ((o95 (+ k97 1)))
  (=> (in_range1 o95)
  (forall ((k98 Int))
  (=> (= k98 o95)
  (let ((o96 (+ k98 1)))
  (=> (in_range1 o96)
  (forall ((k99 Int))
  (=> (= k99 o96)
  (let ((o97 (+ k99 1)))
  (=> (in_range1 o97)
  (forall ((k100 Int))
  (=> (= k100 o97)
  (let ((o98 (+ k100 1)))
  (=> (in_range1 o98)
  (forall ((k101 Int))
  (=> (= k101 o98)
  (let ((o99 (+ k101 1)))
  (=> (in_range1 o99)
  (forall ((k102 Int))
  (=> (= k102 o99)
  (let ((o100 (+ k102 1)))
  (=> (in_range1 o100)
  (forall ((k103 Int))
  (=> (= k103 o100)
  (let ((o101 (+ k103 1)))
  (=> (in_range1 o101)
  (forall ((k104 Int))
  (=> (= k104 o101)
  (let ((o102 (+ k104 1)))
  (=> (in_range1 o102)
  (forall ((k105 Int))
  (=> (= k105 o102)
  (let ((o103 (+ k105 1)))
  (=> (in_range1 o103)
  (forall ((k106 Int))
  (=> (= k106 o103)
  (let ((o104 (+ k106 1)))
  (=> (in_range1 o104)
  (forall ((k107 Int))
  (=> (= k107 o104)
  (let ((o105 (+ k107 1)))
  (=> (in_range1 o105)
  (forall ((k108 Int))
  (=> (= k108 o105)
  (let ((o106 (+ k108 1)))
  (=> (in_range1 o106)
  (forall ((k109 Int))
  (=> (= k109 o106)
  (let ((o107 (+ k109 1)))
  (=> (in_range1 o107)
  (forall ((k110 Int))
  (=> (= k110 o107)
  (let ((o108 (+ k110 1)))
  (=> (in_range1 o108)
  (forall ((k111 Int))
  (=> (= k111 o108)
  (let ((o109 (+ k111 1)))
  (=> (in_range1 o109) (forall ((k112 Int)) (=> (= k112 o109) (= k112 100)))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))
(check-sat)
(exit)
