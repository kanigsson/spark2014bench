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

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(declare-const attr__ATTRIBUTE_ADDRESS1 Int)

(declare-const attr__ATTRIBUTE_ADDRESS2 Int)

(declare-const attr__ATTRIBUTE_ADDRESS3 Int)

(define-fun dynamic_invariant ((temp___expr_18 Int) (temp___is_init_14 Bool)
  (temp___skip_constant_15 Bool) (temp___do_toplevel_16 Bool)
  (temp___do_typ_inv_17 Bool)) Bool (=>
                                    (or (= temp___is_init_14 true)
                                    (<= (- 2147483648) 2147483647))
                                    (in_range1 temp___expr_18)))

(declare-const rliteral integer)

;; rliteral_axiom
  (assert (= (integerqtint rliteral) 0))

(assert
;; defqtvc
 ;; File "test.adb", line 15, characters 0-0
  (not
  (forall ((table (Array Int integer)) (temp_table (Array Int integer))
  (table1 (Array Int integer)) (i Int) (o integer)
  (temp_table1 (Array Int integer)) (i1 Int) (o1 integer)
  (temp_table2 (Array Int integer)) (i2 Int) (o2 integer)
  (temp_table3 (Array Int integer)) (i3 Int) (o3 integer)
  (temp_table4 (Array Int integer)) (i4 Int) (o4 integer)
  (temp_table5 (Array Int integer)) (i5 Int) (o5 integer)
  (temp_table6 (Array Int integer)) (i6 Int) (o6 integer)
  (temp_table7 (Array Int integer)) (i7 Int) (o7 integer)
  (temp_table8 (Array Int integer)) (i8 Int) (o8 integer)
  (temp_table9 (Array Int integer)) (x Int))
  (=>
  (exists ((i9 Int))
  (and (= i9 9)
  (exists ((o9 integer))
  (and (= (to_rep o9) i9)
  (exists ((table2 (Array Int integer)))
  (and (= table2 (store table (- 10 i9) o9))
  (exists ((i10 Int))
  (and (= i10 8)
  (exists ((o10 integer))
  (and (= (to_rep o10) i10)
  (exists ((table3 (Array Int integer)))
  (and (= table3 (store table2 (- 10 i10) o10))
  (exists ((i11 Int))
  (and (= i11 7)
  (exists ((o11 integer))
  (and (= (to_rep o11) i11)
  (exists ((table4 (Array Int integer)))
  (and (= table4 (store table3 (- 10 i11) o11))
  (exists ((i12 Int))
  (and (= i12 6)
  (exists ((o12 integer))
  (and (= (to_rep o12) i12)
  (exists ((table5 (Array Int integer)))
  (and (= table5 (store table4 (- 10 i12) o12))
  (exists ((i13 Int))
  (and (= i13 5)
  (exists ((o13 integer))
  (and (= (to_rep o13) i13)
  (exists ((table6 (Array Int integer)))
  (and (= table6 (store table5 (- 10 i13) o13))
  (exists ((i14 Int))
  (and (= i14 4)
  (exists ((o14 integer))
  (and (= (to_rep o14) i14)
  (exists ((table7 (Array Int integer)))
  (and (= table7 (store table6 (- 10 i14) o14))
  (exists ((i15 Int))
  (and (= i15 3)
  (exists ((o15 integer))
  (and (= (to_rep o15) i15)
  (exists ((table8 (Array Int integer)))
  (and (= table8 (store table7 (- 10 i15) o15))
  (exists ((i16 Int))
  (and (= i16 2)
  (exists ((o16 integer))
  (and (= (to_rep o16) i16)
  (exists ((table9 (Array Int integer)))
  (and (= table9 (store table8 (- 10 i16) o16))
  (exists ((i17 Int))
  (and (= i17 1)
  (exists ((o17 integer))
  (and (= (to_rep o17) i17)
  (exists ((table10 (Array Int integer)))
  (and (= table10 (store table9 (- 10 i17) o17))
  (and
  (exists ((x1 Int))
  (and (and (<= 1 x1) (<= x1 9)) (= x1 (to_rep (select table10 x1)))))
  (exists ((spark__branch Bool))
  (and
  (= spark__branch (ite (forall ((x1 Int))
                        (=> (and (<= 1 x1) (<= x1 9))
                        (< 0 (to_rep (select table10 x1)))))
                   true false))
  (ite (= spark__branch true) (= table1 (store table10 5 rliteral))
  (= table1 table10)))))))))))))))))))))))))))))))))))))))))))))))))))))))))))
  (=> (= i 1)
  (=> (= (to_rep o) i)
  (=> (= temp_table1 (store temp_table i o))
  (=> (= i1 2)
  (=> (= (to_rep o1) i1)
  (=> (= temp_table2 (store temp_table1 i1 o1))
  (=> (= i2 3)
  (=> (= (to_rep o2) i2)
  (=> (= temp_table3 (store temp_table2 i2 o2))
  (=> (= i3 4)
  (=> (= (to_rep o3) i3)
  (=> (= temp_table4 (store temp_table3 i3 o3))
  (=> (= i4 5)
  (=> (= (to_rep o4) i4)
  (=> (= temp_table5 (store temp_table4 i4 o4))
  (=> (= i5 6)
  (=> (= (to_rep o5) i5)
  (=> (= temp_table6 (store temp_table5 i5 o5))
  (=> (= i6 7)
  (=> (= (to_rep o6) i6)
  (=> (= temp_table7 (store temp_table6 i6 o6))
  (=> (= i7 8)
  (=> (= (to_rep o7) i7)
  (=> (= temp_table8 (store temp_table7 i7 o7))
  (=> (= i8 9)
  (=> (= (to_rep o8) i8)
  (=> (= temp_table9 (store temp_table8 i8 o8))
  (=> (<= 1 x)
  (=> (<= x 9)
  (not (= (to_rep (select table1 x)) (to_rep (select temp_table9 x)))))))))))))))))))))))))))))))))))))
(check-sat)
(exit)
