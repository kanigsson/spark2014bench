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

(declare-datatypes ((us_rep 0))
(((us_repqtmk
  (rec__early_exits__int_acc__is_null_pointer Bool)(rec__early_exits__int_acc__pointer_address Int)(rec__early_exits__int_acc__pointer_value integer)))))
(define-fun us_rep_rec__early_exits__int_acc__is_null_pointer__projection ((a us_rep)) Bool 
  (rec__early_exits__int_acc__is_null_pointer a))

(define-fun us_rep_rec__early_exits__int_acc__pointer_address__projection ((a us_rep)) Int 
  (rec__early_exits__int_acc__pointer_address a))

(define-fun us_rep_rec__early_exits__int_acc__pointer_value__projection ((a us_rep)) integer 
  (rec__early_exits__int_acc__pointer_value a))

(declare-datatypes ((us_rep__ref 0))
(((us_rep__refqtmk (us_rep__content us_rep)))))
(define-fun us_rep__ref___rep__content__projection ((a us_rep__ref)) us_rep 
  (us_rep__content a))

(define-fun bool_eq ((a us_rep)
  (b us_rep)) Bool (ite (and
                        (= (rec__early_exits__int_acc__is_null_pointer a) 
                        (rec__early_exits__int_acc__is_null_pointer b))
                        (=>
                        (not
                        (= (rec__early_exits__int_acc__is_null_pointer a) true))
                        (and
                        (= (rec__early_exits__int_acc__pointer_address a) 
                        (rec__early_exits__int_acc__pointer_address b))
                        (= (rec__early_exits__int_acc__pointer_value a) 
                        (rec__early_exits__int_acc__pointer_value b)))))
                   true false))

(define-fun rec__early_exits__int_acc__pointer_value__pred ((a us_rep)) Bool 
  (not (= (rec__early_exits__int_acc__is_null_pointer a) true)))

(declare-const us_null_pointer us_rep)

;; __null_pointer__def_axiom
  (assert
  (= (rec__early_exits__int_acc__is_null_pointer us_null_pointer) true))

(declare-const dummy1 us_rep)

(declare-datatypes ((int_acc__ref 0))
(((int_acc__refqtmk (int_acc__content us_rep)))))
(define-fun int_acc__ref_int_acc__content__projection ((a int_acc__ref)) us_rep 
  (int_acc__content a))

(declare-datatypes ((us_split_fields 0))
(((us_split_fieldsqtmk
  (rec__early_exits__two_acc__f us_rep)(rec__early_exits__two_acc__g us_rep)))))
(define-fun us_split_fields_rec__early_exits__two_acc__f__projection ((a us_split_fields)) us_rep 
  (rec__early_exits__two_acc__f a))

(define-fun us_split_fields_rec__early_exits__two_acc__g__projection ((a us_split_fields)) us_rep 
  (rec__early_exits__two_acc__g a))

(declare-datatypes ((us_split_fields__ref 0))
(((us_split_fields__refqtmk (us_split_fields__content us_split_fields)))))
(define-fun us_split_fields__ref___split_fields__content__projection ((a us_split_fields__ref)) us_split_fields 
  (us_split_fields__content a))

(declare-datatypes ((us_rep1 0))
(((us_repqtmk1 (us_split_fields1 us_split_fields)))))
(define-fun us_rep___split_fields__projection ((a us_rep1)) us_split_fields 
  (us_split_fields1 a))

(define-fun bool_eq1 ((a us_rep1)
  (b us_rep1)) Bool (ite (and
                         (= (bool_eq
                            (rec__early_exits__two_acc__f
                            (us_split_fields1 a))
                            (rec__early_exits__two_acc__f
                            (us_split_fields1 b))) true)
                         (= (bool_eq
                            (rec__early_exits__two_acc__g
                            (us_split_fields1 a))
                            (rec__early_exits__two_acc__g
                            (us_split_fields1 b))) true))
                    true false))

(declare-const value__size Int)

(declare-const object__size Int)

(declare-const alignment Int)

;; value__size_axiom
  (assert (<= 0 value__size))

;; object__size_axiom
  (assert (<= 0 object__size))

;; alignment_axiom
  (assert (<= 0 alignment))

(declare-const early_exits__two_acc__f__first__bit Int)

(declare-const early_exits__two_acc__f__last__bit Int)

(declare-const early_exits__two_acc__f__position Int)

;; early_exits__two_acc__f__first__bit_axiom
  (assert (<= 0 early_exits__two_acc__f__first__bit))

;; early_exits__two_acc__f__last__bit_axiom
  (assert
  (< early_exits__two_acc__f__first__bit early_exits__two_acc__f__last__bit))

;; early_exits__two_acc__f__position_axiom
  (assert (<= 0 early_exits__two_acc__f__position))

(declare-const early_exits__two_acc__g__first__bit Int)

(declare-const early_exits__two_acc__g__last__bit Int)

(declare-const early_exits__two_acc__g__position Int)

;; early_exits__two_acc__g__first__bit_axiom
  (assert (<= 0 early_exits__two_acc__g__first__bit))

;; early_exits__two_acc__g__last__bit_axiom
  (assert
  (< early_exits__two_acc__g__first__bit early_exits__two_acc__g__last__bit))

;; early_exits__two_acc__g__position_axiom
  (assert (<= 0 early_exits__two_acc__g__position))

(declare-fun user_eq1 (us_rep1 us_rep1) Bool)

(declare-const dummy2 us_rep1)

(declare-datatypes ((two_acc__ref 0))
(((two_acc__refqtmk (two_acc__content us_rep1)))))
(define-fun two_acc__ref_two_acc__content__projection ((a two_acc__ref)) us_rep1 
  (two_acc__content a))

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(define-fun dynamic_invariant ((temp___expr_186 us_rep1)
  (temp___is_init_182 Bool) (temp___skip_constant_183 Bool)
  (temp___do_toplevel_184 Bool)
  (temp___do_typ_inv_185 Bool)) Bool (and
                                     (not
                                     (= (rec__early_exits__int_acc__is_null_pointer
                                        (rec__early_exits__two_acc__f
                                        (us_split_fields1 temp___expr_186))) true))
                                     (not
                                     (= (rec__early_exits__int_acc__is_null_pointer
                                        (rec__early_exits__two_acc__g
                                        (us_split_fields1 temp___expr_186))) true))))

(define-fun default_initial_assumption ((temp___expr_187 us_rep1)
  (temp___skip_top_level_188 Bool)) Bool (and
                                         (= (rec__early_exits__int_acc__is_null_pointer
                                            (rec__early_exits__two_acc__f
                                            (us_split_fields1
                                            temp___expr_187))) true)
                                         (= (rec__early_exits__int_acc__is_null_pointer
                                            (rec__early_exits__two_acc__g
                                            (us_split_fields1
                                            temp___expr_187))) true)))

(declare-const dummy3 us_rep)

(declare-datatypes ((t3b__ref 0))
(((t3b__refqtmk (t3b__content us_rep)))))
(define-fun t3b__ref_t3b__content__projection ((a t3b__ref)) us_rep (t3b__content
                                                                    a))

(declare-const attr__ATTRIBUTE_ADDRESS1 Int)

(declare-sort us_pledge_ty 0)

(declare-datatypes ((us_pledge_ty__ref 0))
(((us_pledge_ty__refqtmk (us_pledge_ty__content us_pledge_ty)))))
(declare-fun us_pledge_get (us_pledge_ty us_rep1 us_rep) Bool)

(declare-const attr__ATTRIBUTE_ADDRESS2 Int)

(declare-const dummy4 us_rep)

(declare-datatypes ((t5b__ref 0))
(((t5b__refqtmk (t5b__content us_rep)))))
(define-fun t5b__ref_t5b__content__projection ((a t5b__ref)) us_rep (t5b__content
                                                                    a))

(declare-const attr__ATTRIBUTE_ADDRESS3 Int)

(declare-sort us_pledge_ty1 0)

(declare-datatypes ((us_pledge_ty__ref1 0))
(((us_pledge_ty__refqtmk1 (us_pledge_ty__content1 us_pledge_ty1)))))
(declare-fun us_pledge_get1 (us_pledge_ty1 us_rep1 us_rep) Bool)

(declare-const attr__ATTRIBUTE_ADDRESS4 Int)

(define-fun dynamic_invariant1 ((temp___expr_18 Int) (temp___is_init_14 Bool)
  (temp___skip_constant_15 Bool) (temp___do_toplevel_16 Bool)
  (temp___do_typ_inv_17 Bool)) Bool (=>
                                    (or (= temp___is_init_14 true)
                                    (<= (- 2147483648) 2147483647))
                                    (in_range1 temp___expr_18)))

(define-fun dynamic_invariant2 ((temp___expr_179 us_rep)
  (temp___is_init_175 Bool) (temp___skip_constant_176 Bool)
  (temp___do_toplevel_177 Bool)
  (temp___do_typ_inv_178 Bool)) Bool (not
                                     (= (rec__early_exits__int_acc__is_null_pointer
                                        temp___expr_179) true)))

(define-fun default_initial_assumption1 ((temp___expr_180 us_rep)
  (temp___skip_top_level_181 Bool)) Bool (= (rec__early_exits__int_acc__is_null_pointer
                                            temp___expr_180) true))

(assert
;; defqtvc
 ;; File "early_exits.adb", line 8, characters 0-0
  (not
  (forall ((x__split_fields us_split_fields))
  (=> (dynamic_invariant (us_repqtmk1 x__split_fields) true false true true)
  (=>
  (= (to_rep
     (rec__early_exits__int_acc__pointer_value
     (rec__early_exits__two_acc__f x__split_fields))) (to_rep
                                                      (rec__early_exits__int_acc__pointer_value
                                                      (rec__early_exits__two_acc__g
                                                      x__split_fields))))
  (let ((early_exits__p1__B_1__y__assume (rec__early_exits__two_acc__f
                                         x__split_fields)))
  (forall ((usf us_pledge_ty))
  (=>
  (forall ((temp___borrowed_220 us_rep1))
  (forall ((temp___brower_218 us_rep))
  (! (= (= (us_pledge_get usf temp___borrowed_220 temp___brower_218) true)
     (= (rec__early_exits__two_acc__f (us_split_fields1 temp___borrowed_220)) temp___brower_218)) :pattern (
  (us_pledge_get usf temp___borrowed_220 temp___brower_218)) )))
  (forall ((early_exits__p1__B_1__y__pledge us_pledge_ty))
  (=> (= early_exits__p1__B_1__y__pledge usf)
  (forall ((y__pointer_value integer))
  (=>
  (= y__pointer_value (rec__early_exits__int_acc__pointer_value
                      early_exits__p1__B_1__y__assume))
  (forall ((y__pointer_address Int))
  (=>
  (= y__pointer_address (rec__early_exits__int_acc__pointer_address
                        early_exits__p1__B_1__y__assume))
  (forall ((y__is_null_pointer Bool))
  (=>
  (= y__is_null_pointer (rec__early_exits__int_acc__is_null_pointer
                        early_exits__p1__B_1__y__assume))
  (forall ((i Int))
  (=> (= i 1)
  (=> (= (and (ite (<= 1 i) true false) (ite (<= i 10) true false)) true)
  (forall ((x__split_fields1 us_split_fields) (y__pointer_value1 integer)
  (i1 Int))
  (=>
  (= (and (ite (and (dynamic_invariant (us_repqtmk1 x__split_fields1) true
               true true true)
               (= (rec__early_exits__two_acc__f x__split_fields1) (rec__early_exits__two_acc__f
                                                                  x__split_fields)))
          true false) (ite (and (<= 1 i1) (<= i1 10)) true false)) true)
  (let ((early_exits__p1__B_1__B_2__z__assume (rec__early_exits__two_acc__g
                                              x__split_fields1)))
  (forall ((usf1 us_pledge_ty1))
  (=>
  (forall ((temp___borrowed_197 us_rep1))
  (forall ((temp___brower_195 us_rep))
  (! (= (= (us_pledge_get1 usf1 temp___borrowed_197 temp___brower_195) true)
     (= (rec__early_exits__two_acc__g (us_split_fields1 temp___borrowed_197)) temp___brower_195)) :pattern (
  (us_pledge_get1 usf1 temp___borrowed_197 temp___brower_195)) )))
  (forall ((early_exits__p1__B_1__B_2__z__pledge us_pledge_ty1))
  (=> (= early_exits__p1__B_1__B_2__z__pledge usf1)
  (forall ((z__pointer_value integer))
  (=>
  (= z__pointer_value (rec__early_exits__int_acc__pointer_value
                      early_exits__p1__B_1__B_2__z__assume))
  (forall ((z__pointer_address Int))
  (=>
  (= z__pointer_address (rec__early_exits__int_acc__pointer_address
                        early_exits__p1__B_1__B_2__z__assume))
  (forall ((z__is_null_pointer Bool))
  (=>
  (= z__is_null_pointer (rec__early_exits__int_acc__is_null_pointer
                        early_exits__p1__B_1__B_2__z__assume))
  (=>
  (or
  (exists ((o Int))
  (and (= (to_rep z__pointer_value) o)
  (exists ((spark__branch Bool))
  (and (= spark__branch (ite (= o 2147483647) true false))
  (and (not (= spark__branch true))
  (exists ((o1 Int))
  (and (= (to_rep z__pointer_value) o1)
  (and (not (= o1 0))
  (exists ((o2 Int))
  (and (= (to_rep z__pointer_value) o2)
  (let ((o3 (+ o2 1)))
  (and (in_range1 o3)
  (exists ((o4 integer))
  (and (= (to_rep o4) o3)
  (exists ((z__pointer_value1 integer))
  (and (= z__pointer_value1 o4)
  (exists ((o5 Int))
  (and (= (to_rep z__pointer_value1) o5)
  (exists ((spark__branch1 Bool))
  (and (= spark__branch1 (ite (= o5 2147483647) true false))
  (and (not (= spark__branch1 true))
  (exists ((o6 Int))
  (and (= (to_rep z__pointer_value1) o6)
  (and (not (= o6 0))
  (exists ((o7 Int))
  (and (= (to_rep z__pointer_value1) o7)
  (let ((o8 (+ o7 1)))
  (and (in_range1 o8)
  (exists ((o9 integer))
  (and (= (to_rep o9) o8)
  (exists ((z__pointer_value2 integer))
  (and (= z__pointer_value2 o9)
  (exists ((o10 Int))
  (and (= (to_rep z__pointer_value2) o10)
  (exists ((spark__branch2 Bool))
  (and (= spark__branch2 (ite (= o10 2147483647) true false))
  (and (not (= spark__branch2 true))
  (exists ((o11 Int))
  (and (= (to_rep z__pointer_value2) o11)
  (and (not (= o11 0))
  (exists ((o12 Int))
  (and (= (to_rep z__pointer_value2) o12)
  (let ((o13 (+ o12 1)))
  (and (in_range1 o13)
  (exists ((o14 integer))
  (and (= (to_rep o14) o13)
  (exists ((z__pointer_value3 integer))
  (and (= z__pointer_value3 o14)
  (exists ((o15 Int))
  (and (= (to_rep z__pointer_value3) o15)
  (exists ((spark__branch3 Bool))
  (and (= spark__branch3 (ite (= o15 2147483647) true false))
  (and (not (= spark__branch3 true))
  (exists ((o16 Int))
  (and (= (to_rep z__pointer_value3) o16)
  (and (not (= o16 0))
  (exists ((o17 Int))
  (and (= (to_rep z__pointer_value3) o17)
  (let ((o18 (+ o17 1)))
  (and (in_range1 o18)
  (exists ((o19 integer))
  (and (= (to_rep o19) o18)
  (exists ((z__pointer_value4 integer))
  (and (= z__pointer_value4 o19)
  (exists ((o20 Int))
  (and (= (to_rep z__pointer_value4) o20)
  (exists ((spark__branch4 Bool))
  (and (= spark__branch4 (ite (= o20 2147483647) true false))
  (and (not (= spark__branch4 true))
  (exists ((o21 Int))
  (and (= (to_rep z__pointer_value4) o21)
  (and (not (= o21 0))
  (exists ((o22 Int))
  (and (= (to_rep z__pointer_value4) o22)
  (let ((o23 (+ o22 1)))
  (and (in_range1 o23)
  (exists ((o24 integer))
  (and (= (to_rep o24) o23)
  (exists ((z__pointer_value5 integer))
  (and (= z__pointer_value5 o24)
  (exists ((o25 Int))
  (and (= (to_rep z__pointer_value5) o25)
  (exists ((spark__branch5 Bool))
  (and (= spark__branch5 (ite (= o25 2147483647) true false))
  (and (not (= spark__branch5 true))
  (exists ((o26 Int))
  (and (= (to_rep z__pointer_value5) o26)
  (and (not (= o26 0))
  (exists ((o27 Int))
  (and (= (to_rep z__pointer_value5) o27)
  (let ((o28 (+ o27 1)))
  (and (in_range1 o28)
  (exists ((o29 integer))
  (and (= (to_rep o29) o28)
  (exists ((z__pointer_value6 integer))
  (and (= z__pointer_value6 o29)
  (exists ((o30 Int))
  (and (= (to_rep z__pointer_value6) o30)
  (exists ((spark__branch6 Bool))
  (and (= spark__branch6 (ite (= o30 2147483647) true false))
  (and (not (= spark__branch6 true))
  (exists ((o31 Int))
  (and (= (to_rep z__pointer_value6) o31)
  (and (not (= o31 0))
  (exists ((o32 Int))
  (and (= (to_rep z__pointer_value6) o32)
  (let ((o33 (+ o32 1)))
  (and (in_range1 o33)
  (exists ((o34 integer))
  (and (= (to_rep o34) o33)
  (exists ((z__pointer_value7 integer))
  (and (= z__pointer_value7 o34)
  (exists ((o35 Int))
  (and (= (to_rep z__pointer_value7) o35)
  (exists ((spark__branch7 Bool))
  (and (= spark__branch7 (ite (= o35 2147483647) true false))
  (and (not (= spark__branch7 true))
  (exists ((o36 Int))
  (and (= (to_rep z__pointer_value7) o36)
  (and (not (= o36 0))
  (exists ((o37 Int))
  (and (= (to_rep z__pointer_value7) o37)
  (let ((o38 (+ o37 1)))
  (and (in_range1 o38)
  (exists ((o39 integer))
  (and (= (to_rep o39) o38)
  (exists ((z__pointer_value8 integer))
  (and (= z__pointer_value8 o39)
  (exists ((o40 Int))
  (and (= (to_rep z__pointer_value8) o40)
  (exists ((spark__branch8 Bool))
  (and (= spark__branch8 (ite (= o40 2147483647) true false))
  (and (not (= spark__branch8 true))
  (exists ((o41 Int))
  (and (= (to_rep z__pointer_value8) o41)
  (and (not (= o41 0))
  (exists ((o42 Int))
  (and (= (to_rep z__pointer_value8) o42)
  (let ((o43 (+ o42 1)))
  (and (in_range1 o43)
  (exists ((o44 integer))
  (and (= (to_rep o44) o43)
  (exists ((z__pointer_value9 integer))
  (and (= z__pointer_value9 o44)
  (exists ((o45 Int))
  (and (= (to_rep z__pointer_value9) o45)
  (exists ((spark__branch9 Bool))
  (and (= spark__branch9 (ite (= o45 2147483647) true false))
  (and (not (= spark__branch9 true))
  (exists ((o46 Int))
  (and (= (to_rep z__pointer_value9) o46)
  (and (not (= o46 0))
  (exists ((o47 Int))
  (and (= (to_rep z__pointer_value9) o47)
  (let ((o48 (+ o47 1)))
  (and (in_range1 o48)
  (exists ((o49 integer))
  (and (= (to_rep o49) o48)
  (exists ((z__pointer_value10 integer))
  (and (= z__pointer_value10 o49)
  (exists ((o50 Int))
  (and (= (to_rep z__pointer_value10) o50)
  (exists ((spark__branch10 Bool))
  (and (= spark__branch10 (ite (= o50 2147483647) true false))
  (and (not (= spark__branch10 true))
  (exists ((o51 Int))
  (and (= (to_rep z__pointer_value10) o51)
  (and (not (= o51 0))
  (exists ((o52 Int))
  (and (= (to_rep z__pointer_value10) o52)
  (let ((o53 (+ o52 1)))
  (and (in_range1 o53)
  (exists ((o54 integer))
  (and (= (to_rep o54) o53)
  (exists ((z__pointer_value11 integer))
  (and (= z__pointer_value11 o54)
  (exists ((o55 Int))
  (and (= (to_rep z__pointer_value11) o55)
  (exists ((spark__branch11 Bool))
  (and (= spark__branch11 (ite (= o55 2147483647) true false))
  (and (not (= spark__branch11 true))
  (exists ((o56 Int))
  (and (= (to_rep z__pointer_value11) o56)
  (and (not (= o56 0))
  (exists ((o57 Int))
  (and (= (to_rep z__pointer_value11) o57)
  (let ((o58 (+ o57 1)))
  (and (in_range1 o58)
  (exists ((o59 integer))
  (and (= (to_rep o59) o58)
  (exists ((z__pointer_value12 integer))
  (and (= z__pointer_value12 o59)
  (exists ((o60 Int))
  (and (= (to_rep z__pointer_value12) o60)
  (exists ((spark__branch12 Bool))
  (and (= spark__branch12 (ite (= o60 2147483647) true false))
  (and (not (= spark__branch12 true))
  (exists ((o61 Int))
  (and (= (to_rep z__pointer_value12) o61)
  (and (not (= o61 0))
  (exists ((o62 Int))
  (and (= (to_rep z__pointer_value12) o62)
  (let ((o63 (+ o62 1)))
  (and (in_range1 o63)
  (exists ((o64 integer))
  (and (= (to_rep o64) o63)
  (exists ((z__pointer_value13 integer))
  (and (= z__pointer_value13 o64)
  (exists ((o65 Int))
  (and (= (to_rep z__pointer_value13) o65)
  (exists ((spark__branch13 Bool))
  (and (= spark__branch13 (ite (= o65 2147483647) true false))
  (and (not (= spark__branch13 true))
  (exists ((o66 Int))
  (and (= (to_rep z__pointer_value13) o66)
  (and (not (= o66 0))
  (exists ((o67 Int))
  (and (= (to_rep z__pointer_value13) o67)
  (let ((o68 (+ o67 1)))
  (and (in_range1 o68)
  (exists ((o69 integer))
  (and (= (to_rep o69) o68)
  (exists ((z__pointer_value14 integer))
  (and (= z__pointer_value14 o69)
  (exists ((o70 Int))
  (and (= (to_rep z__pointer_value14) o70)
  (exists ((spark__branch14 Bool))
  (and (= spark__branch14 (ite (= o70 2147483647) true false))
  (and (not (= spark__branch14 true))
  (exists ((o71 Int))
  (and (= (to_rep z__pointer_value14) o71)
  (and (not (= o71 0))
  (exists ((o72 Int))
  (and (= (to_rep z__pointer_value14) o72)
  (let ((o73 (+ o72 1)))
  (and (in_range1 o73) (exists ((o74 integer)) (= (to_rep o74) o73))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))
  (exists ((o Int))
  (and (= (to_rep z__pointer_value) o)
  (exists ((spark__branch Bool))
  (and (= spark__branch (ite (= o 2147483647) true false))
  (and (not (= spark__branch true))
  (exists ((o1 Int))
  (and (= (to_rep z__pointer_value) o1)
  (or (= o1 0)
  (exists ((o2 Int))
  (and (= (to_rep z__pointer_value) o2)
  (let ((o3 (+ o2 1)))
  (and (in_range1 o3)
  (exists ((o4 integer))
  (and (= (to_rep o4) o3)
  (exists ((z__pointer_value1 integer))
  (and (= z__pointer_value1 o4)
  (exists ((o5 Int))
  (and (= (to_rep z__pointer_value1) o5)
  (exists ((spark__branch1 Bool))
  (and (= spark__branch1 (ite (= o5 2147483647) true false))
  (and (not (= spark__branch1 true))
  (exists ((o6 Int))
  (and (= (to_rep z__pointer_value1) o6)
  (or (= o6 0)
  (exists ((o7 Int))
  (and (= (to_rep z__pointer_value1) o7)
  (let ((o8 (+ o7 1)))
  (and (in_range1 o8)
  (exists ((o9 integer))
  (and (= (to_rep o9) o8)
  (exists ((z__pointer_value2 integer))
  (and (= z__pointer_value2 o9)
  (exists ((o10 Int))
  (and (= (to_rep z__pointer_value2) o10)
  (exists ((spark__branch2 Bool))
  (and (= spark__branch2 (ite (= o10 2147483647) true false))
  (and (not (= spark__branch2 true))
  (exists ((o11 Int))
  (and (= (to_rep z__pointer_value2) o11)
  (or (= o11 0)
  (exists ((o12 Int))
  (and (= (to_rep z__pointer_value2) o12)
  (let ((o13 (+ o12 1)))
  (and (in_range1 o13)
  (exists ((o14 integer))
  (and (= (to_rep o14) o13)
  (exists ((z__pointer_value3 integer))
  (and (= z__pointer_value3 o14)
  (exists ((o15 Int))
  (and (= (to_rep z__pointer_value3) o15)
  (exists ((spark__branch3 Bool))
  (and (= spark__branch3 (ite (= o15 2147483647) true false))
  (and (not (= spark__branch3 true))
  (exists ((o16 Int))
  (and (= (to_rep z__pointer_value3) o16)
  (or (= o16 0)
  (exists ((o17 Int))
  (and (= (to_rep z__pointer_value3) o17)
  (let ((o18 (+ o17 1)))
  (and (in_range1 o18)
  (exists ((o19 integer))
  (and (= (to_rep o19) o18)
  (exists ((z__pointer_value4 integer))
  (and (= z__pointer_value4 o19)
  (exists ((o20 Int))
  (and (= (to_rep z__pointer_value4) o20)
  (exists ((spark__branch4 Bool))
  (and (= spark__branch4 (ite (= o20 2147483647) true false))
  (and (not (= spark__branch4 true))
  (exists ((o21 Int))
  (and (= (to_rep z__pointer_value4) o21)
  (or (= o21 0)
  (exists ((o22 Int))
  (and (= (to_rep z__pointer_value4) o22)
  (let ((o23 (+ o22 1)))
  (and (in_range1 o23)
  (exists ((o24 integer))
  (and (= (to_rep o24) o23)
  (exists ((z__pointer_value5 integer))
  (and (= z__pointer_value5 o24)
  (exists ((o25 Int))
  (and (= (to_rep z__pointer_value5) o25)
  (exists ((spark__branch5 Bool))
  (and (= spark__branch5 (ite (= o25 2147483647) true false))
  (and (not (= spark__branch5 true))
  (exists ((o26 Int))
  (and (= (to_rep z__pointer_value5) o26)
  (or (= o26 0)
  (exists ((o27 Int))
  (and (= (to_rep z__pointer_value5) o27)
  (let ((o28 (+ o27 1)))
  (and (in_range1 o28)
  (exists ((o29 integer))
  (and (= (to_rep o29) o28)
  (exists ((z__pointer_value6 integer))
  (and (= z__pointer_value6 o29)
  (exists ((o30 Int))
  (and (= (to_rep z__pointer_value6) o30)
  (exists ((spark__branch6 Bool))
  (and (= spark__branch6 (ite (= o30 2147483647) true false))
  (and (not (= spark__branch6 true))
  (exists ((o31 Int))
  (and (= (to_rep z__pointer_value6) o31)
  (or (= o31 0)
  (exists ((o32 Int))
  (and (= (to_rep z__pointer_value6) o32)
  (let ((o33 (+ o32 1)))
  (and (in_range1 o33)
  (exists ((o34 integer))
  (and (= (to_rep o34) o33)
  (exists ((z__pointer_value7 integer))
  (and (= z__pointer_value7 o34)
  (exists ((o35 Int))
  (and (= (to_rep z__pointer_value7) o35)
  (exists ((spark__branch7 Bool))
  (and (= spark__branch7 (ite (= o35 2147483647) true false))
  (and (not (= spark__branch7 true))
  (exists ((o36 Int))
  (and (= (to_rep z__pointer_value7) o36)
  (or (= o36 0)
  (exists ((o37 Int))
  (and (= (to_rep z__pointer_value7) o37)
  (let ((o38 (+ o37 1)))
  (and (in_range1 o38)
  (exists ((o39 integer))
  (and (= (to_rep o39) o38)
  (exists ((z__pointer_value8 integer))
  (and (= z__pointer_value8 o39)
  (exists ((o40 Int))
  (and (= (to_rep z__pointer_value8) o40)
  (exists ((spark__branch8 Bool))
  (and (= spark__branch8 (ite (= o40 2147483647) true false))
  (and (not (= spark__branch8 true))
  (exists ((o41 Int))
  (and (= (to_rep z__pointer_value8) o41)
  (or (= o41 0)
  (exists ((o42 Int))
  (and (= (to_rep z__pointer_value8) o42)
  (let ((o43 (+ o42 1)))
  (and (in_range1 o43)
  (exists ((o44 integer))
  (and (= (to_rep o44) o43)
  (exists ((z__pointer_value9 integer))
  (and (= z__pointer_value9 o44)
  (exists ((o45 Int))
  (and (= (to_rep z__pointer_value9) o45)
  (exists ((spark__branch9 Bool))
  (and (= spark__branch9 (ite (= o45 2147483647) true false))
  (and (not (= spark__branch9 true))
  (exists ((o46 Int))
  (and (= (to_rep z__pointer_value9) o46)
  (or (= o46 0)
  (exists ((o47 Int))
  (and (= (to_rep z__pointer_value9) o47)
  (let ((o48 (+ o47 1)))
  (and (in_range1 o48)
  (exists ((o49 integer))
  (and (= (to_rep o49) o48)
  (exists ((z__pointer_value10 integer))
  (and (= z__pointer_value10 o49)
  (exists ((o50 Int))
  (and (= (to_rep z__pointer_value10) o50)
  (exists ((spark__branch10 Bool))
  (and (= spark__branch10 (ite (= o50 2147483647) true false))
  (and (not (= spark__branch10 true))
  (exists ((o51 Int))
  (and (= (to_rep z__pointer_value10) o51)
  (or (= o51 0)
  (exists ((o52 Int))
  (and (= (to_rep z__pointer_value10) o52)
  (let ((o53 (+ o52 1)))
  (and (in_range1 o53)
  (exists ((o54 integer))
  (and (= (to_rep o54) o53)
  (exists ((z__pointer_value11 integer))
  (and (= z__pointer_value11 o54)
  (exists ((o55 Int))
  (and (= (to_rep z__pointer_value11) o55)
  (exists ((spark__branch11 Bool))
  (and (= spark__branch11 (ite (= o55 2147483647) true false))
  (and (not (= spark__branch11 true))
  (exists ((o56 Int))
  (and (= (to_rep z__pointer_value11) o56)
  (or (= o56 0)
  (exists ((o57 Int))
  (and (= (to_rep z__pointer_value11) o57)
  (let ((o58 (+ o57 1)))
  (and (in_range1 o58)
  (exists ((o59 integer))
  (and (= (to_rep o59) o58)
  (exists ((z__pointer_value12 integer))
  (and (= z__pointer_value12 o59)
  (exists ((o60 Int))
  (and (= (to_rep z__pointer_value12) o60)
  (exists ((spark__branch12 Bool))
  (and (= spark__branch12 (ite (= o60 2147483647) true false))
  (and (not (= spark__branch12 true))
  (exists ((o61 Int))
  (and (= (to_rep z__pointer_value12) o61)
  (or (= o61 0)
  (exists ((o62 Int))
  (and (= (to_rep z__pointer_value12) o62)
  (let ((o63 (+ o62 1)))
  (and (in_range1 o63)
  (exists ((o64 integer))
  (and (= (to_rep o64) o63)
  (exists ((z__pointer_value13 integer))
  (and (= z__pointer_value13 o64)
  (exists ((o65 Int))
  (and (= (to_rep z__pointer_value13) o65)
  (exists ((spark__branch13 Bool))
  (and (= spark__branch13 (ite (= o65 2147483647) true false))
  (and (not (= spark__branch13 true))
  (exists ((o66 Int))
  (and (= (to_rep z__pointer_value13) o66)
  (or (= o66 0)
  (exists ((o67 Int))
  (and (= (to_rep z__pointer_value13) o67)
  (let ((o68 (+ o67 1)))
  (and (in_range1 o68)
  (exists ((o69 integer))
  (and (= (to_rep o69) o68)
  (exists ((z__pointer_value14 integer))
  (and (= z__pointer_value14 o69)
  (exists ((o70 Int))
  (and (= (to_rep z__pointer_value14) o70)
  (exists ((spark__branch14 Bool))
  (and (= spark__branch14 (ite (= o70 2147483647) true false))
  (and (not (= spark__branch14 true))
  (exists ((o71 Int)) (and (= (to_rep z__pointer_value14) o71) (= o71 0)))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))
  (rec__early_exits__int_acc__pointer_value__pred
  (us_repqtmk y__is_null_pointer y__pointer_address y__pointer_value1)))))))))))))))))))))))))))))))))))
(check-sat)
(exit)
