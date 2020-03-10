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

(declare-sort integer 0)

(declare-fun integerqtint (integer) Int)

;; integer'axiom
  (assert
  (forall ((i integer))
  (and (<= (- 2147483648) (integerqtint i)) (<= (integerqtint i) 2147483647))))

(define-fun in_range ((x Int)) Bool (and (<= (- 2147483648) x)
                                    (<= x 2147483647)))

(declare-fun attr__ATTRIBUTE_IMAGE (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE (us_image) Int)

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
  (forall ((x integer)) (! (in_range (to_rep x)) :pattern ((to_rep x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range x) (= (to_rep (of_rep x)) x)) :pattern ((to_rep
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

(declare-fun all_elements_in ((Array Int integer) Int) Bool)

(declare-fun all_elements_in__function_guard (Bool (Array Int integer)
  Int) Bool)

(declare-sort positive 0)

(declare-fun positiveqtint (positive) Int)

;; positive'axiom
  (assert
  (forall ((i positive))
  (and (<= 1 (positiveqtint i)) (<= (positiveqtint i) 2147483647))))

(define-fun in_range1 ((x Int)) Bool (and (<= 1 x) (<= x 2147483647)))

(declare-fun attr__ATTRIBUTE_IMAGE1 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check1 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE1 (us_image) Int)

(declare-fun user_eq1 (positive positive) Bool)

(declare-const dummy1 positive)

(declare-datatypes ((positive__ref 0))
(((positive__refqtmk (positive__content positive)))))
(define-fun positive__ref_positive__content__projection ((a positive__ref)) positive 
  (positive__content a))

(define-fun dynamic_invariant ((temp___expr_46 Int) (temp___is_init_42 Bool)
  (temp___skip_constant_43 Bool) (temp___do_toplevel_44 Bool)
  (temp___do_typ_inv_45 Bool)) Bool (=>
                                    (or (= temp___is_init_42 true)
                                    (<= 1 2147483647)) (in_range1
                                    temp___expr_46)))

;; all_elements_in__post_axiom
  (assert true)

;; all_elements_in__def_axiom
  (assert
  (forall ((a (Array Int integer)))
  (forall ((max Int))
  (! (= (= (all_elements_in a max) true)
     (forall ((k Int))
     (=> (and (<= 0 k) (<= k 7))
     (let ((temp___179 (to_rep (select a k))))
     (and (<= (- max) temp___179) (<= temp___179 max)))))) :pattern (
  (all_elements_in a max)) ))))

(declare-const a (Array Int integer))

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(declare-const b (Array Int integer))

(declare-const attr__ATTRIBUTE_ADDRESS1 Int)

(define-fun dynamic_invariant1 ((temp___expr_18 Int) (temp___is_init_14 Bool)
  (temp___skip_constant_15 Bool) (temp___do_toplevel_16 Bool)
  (temp___do_typ_inv_17 Bool)) Bool (=>
                                    (or (= temp___is_init_14 true)
                                    (<= (- 2147483648) 2147483647)) (in_range
                                    temp___expr_18)))

(assert
;; defqtvc
 ;; File "prefixsum_expanded.ads", line 20, characters 0-0
  (not
  (forall ((o Bool))
  (=> (= (all_elements_in a 8000000) true)
  (=> (= (all_elements_in b 1000000) true)
  (=>
  (exists ((o1 Bool))
  (and
  (exists ((o2 Bool))
  (and
  (exists ((o3 Bool))
  (and
  (exists ((o4 Int))
  (and (= (to_rep (select b 7)) o4)
  (exists ((o5 Int))
  (and (= (to_rep (select b 6)) o5)
  (exists ((o6 Int))
  (and (= (to_rep (select b 5)) o6)
  (exists ((o7 Int))
  (and (= (to_rep (select b 4)) o7)
  (exists ((o8 Int))
  (and (= (to_rep (select b 3)) o8)
  (exists ((o9 Int))
  (and (= (to_rep (select b 2)) o9)
  (exists ((o10 Int))
  (and (= (to_rep (select b 1)) o10)
  (exists ((o11 Int))
  (and (= (to_rep (select b 0)) o11)
  (let ((o12 (+ o11 o10)))
  (and (in_range o12)
  (let ((o13 (+ o12 o9)))
  (and (in_range o13)
  (let ((o14 (+ o13 o8)))
  (and (in_range o14)
  (let ((o15 (+ o14 o7)))
  (and (in_range o15)
  (let ((o16 (+ o15 o6)))
  (and (in_range o16)
  (let ((o17 (+ o16 o5)))
  (and (in_range o17)
  (let ((o18 (+ o17 o4)))
  (and (in_range o18)
  (exists ((o19 Int))
  (and (= (to_rep (select a 7)) o19)
  (ite (= o19 o18)
  (exists ((o20 Int))
  (and (= (to_rep (select b 0)) o20)
  (exists ((o21 Int))
  (and (= (to_rep (select b 1)) o21)
  (exists ((o22 Int))
  (and (= (to_rep (select b 2)) o22)
  (exists ((o23 Int))
  (and (= (to_rep (select b 3)) o23)
  (let ((o24 (+ o23 o22)))
  (and (in_range o24)
  (let ((o25 (+ o24 o21)))
  (and (in_range o25)
  (let ((o26 (+ o25 o20)))
  (and (in_range o26)
  (exists ((o27 Int))
  (and (= (to_rep (select a 3)) o27) (= o3 (ite (= o27 o26) true false))))))))))))))))))
  (= o3 false))))))))))))))))))))))))))))))))))
  (ite (= o3 true)
  (exists ((o4 Int))
  (and (= (to_rep (select b 4)) o4)
  (exists ((o5 Int))
  (and (= (to_rep (select b 5)) o5)
  (let ((o6 (+ o5 o4)))
  (and (in_range o6)
  (exists ((o7 Int))
  (and (= (to_rep (select a 5)) o7) (= o2 (ite (= o7 o6) true false))))))))))
  (= o2 false))))
  (ite (= o2 true)
  (exists ((o3 Int))
  (and (= (to_rep (select b 0)) o3)
  (exists ((o4 Int))
  (and (= (to_rep (select b 1)) o4)
  (let ((o5 (+ o4 o3)))
  (and (in_range o5)
  (exists ((o6 Int))
  (and (= (to_rep (select a 1)) o6) (= o1 (ite (= o6 o5) true false))))))))))
  (= o1 false))))
  (ite (= o1 true)
  (exists ((o2 Int))
  (and (= (to_rep (select b 0)) o2)
  (exists ((o3 Int))
  (and (= (to_rep (select a 0)) o3) (= o (ite (= o3 o2) true false))))))
  (= o false)))) (not (= o true))))))))
(check-sat)
(exit)
