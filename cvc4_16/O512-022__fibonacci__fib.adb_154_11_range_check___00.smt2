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

(declare-sort natural 0)

(declare-fun naturalqtint (natural) Int)

;; natural'axiom
  (assert
  (forall ((i natural))
  (and (<= 0 (naturalqtint i)) (<= (naturalqtint i) 2147483647))))

(define-fun in_range2 ((x Int)) Bool (and (<= 0 x) (<= x 2147483647)))

(declare-fun attr__ATTRIBUTE_IMAGE2 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check2 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE2 (us_image) Int)

(declare-fun user_eq1 (natural natural) Bool)

(declare-const dummy1 natural)

(declare-datatypes ((natural__ref 0))
(((natural__refqtmk (natural__content natural)))))
(define-fun natural__ref_natural__content__projection ((a natural__ref)) natural 
  (natural__content a))

(define-fun dynamic_invariant ((temp___expr_39 Int) (temp___is_init_35 Bool)
  (temp___skip_constant_36 Bool) (temp___do_toplevel_37 Bool)
  (temp___do_typ_inv_38 Bool)) Bool (=>
                                    (or (= temp___is_init_35 true)
                                    (<= 0 2147483647)) (in_range2
                                    temp___expr_39)))

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

(declare-const b1 (Array Int integer))

(declare-const attr__ATTRIBUTE_ADDRESS2 Int)

(declare-const b2 (Array Int integer))

(declare-const attr__ATTRIBUTE_ADDRESS3 Int)

(declare-const c1 (Array Int integer))

(declare-const attr__ATTRIBUTE_ADDRESS4 Int)

(declare-const c2 (Array Int integer))

(declare-const attr__ATTRIBUTE_ADDRESS5 Int)

(declare-const k Int)

(declare-const attr__ATTRIBUTE_ADDRESS6 Int)

(declare-const attr__ATTRIBUTE_ADDRESS7 Int)

(declare-const attr__ATTRIBUTE_ADDRESS8 Int)

(declare-const attr__ATTRIBUTE_ADDRESS9 Int)

(declare-const attr__ATTRIBUTE_ADDRESS10 Int)

(declare-sort tintarrayD1 0)

(declare-fun tintarrayD1qtint (tintarrayD1) Int)

;; tintarrayD1'axiom
  (assert
  (forall ((i tintarrayD1))
  (and (<= 0 (tintarrayD1qtint i)) (<= (tintarrayD1qtint i) 100))))

(define-fun in_range3 ((x Int)) Bool (and (<= 0 x) (<= x 100)))

(declare-fun attr__ATTRIBUTE_IMAGE3 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check3 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE3 (us_image) Int)

(declare-fun user_eq2 (tintarrayD1 tintarrayD1) Bool)

(declare-const dummy2 tintarrayD1)

(declare-datatypes ((tintarrayD1__ref 0))
(((tintarrayD1__refqtmk (tintarrayD1__content tintarrayD1)))))
(define-fun tintarrayD1__ref_tintarrayD1__content__projection ((a tintarrayD1__ref)) tintarrayD1 
  (tintarrayD1__content a))

(define-fun dynamic_invariant1 ((temp___expr_18 Int) (temp___is_init_14 Bool)
  (temp___skip_constant_15 Bool) (temp___do_toplevel_16 Bool)
  (temp___do_typ_inv_17 Bool)) Bool (=>
                                    (or (= temp___is_init_14 true)
                                    (<= (- 2147483648) 2147483647))
                                    (in_range1 temp___expr_18)))

(assert
;; defqtvc
 ;; File "fib.ads", line 47, characters 0-0
  (not
  (forall ((a1 (Array Int integer)) (a11 (Array Int integer))
  (a12 (Array Int integer)))
  (=> (dynamic_invariant k true false true true)
  (=> (<= 0 k)
  (=> (<= k 100)
  (=>
  (forall ((i Int))
  (=> (and (<= 0 i) (<= i k))
  (= (to_rep (select b1 i)) (to_rep (select b2 i)))))
  (=>
  (forall ((i Int))
  (=> (and (<= (+ k 1) i) (<= i 100))
  (= (to_rep (select c1 (- i k))) (to_rep (select c2 (- i k))))))
  (=>
  (let ((temp___270 k))
  (exists ((i Int))
  (and (= i 0)
  (ite (= (and (ite (<= 0 i) true false) (ite (<= i temp___270) true false)) true)
  (exists ((a13 (Array Int integer)) (i1 Int))
  (and
  (= (and (ite (forall ((temp___272 Int))
               (=> (and (<= 0 temp___272) (<= temp___272 100))
               (=>
               (or (< temp___270 temp___272)
               (or (< temp___272 0) (<= i1 temp___272)))
               (= (select a13 temp___272) (select a1 temp___272)))))
          true false) (ite (and (<= 0 i1) (<= i1 k)) true false)) true)
  (and (and (<= 0 i1) (<= i1 100))
  (exists ((o Int))
  (and (= (to_rep (select b1 i1)) o)
  (exists ((o1 integer))
  (and (= (to_rep o1) o)
  (and (and (<= 0 i1) (<= i1 100))
  (and (= a11 (store a13 i1 o1)) (= i1 temp___270)))))))))) (= a11 a1)))))
  (=>
  (let ((o (+ k 1)))
  (and (in_range1 o)
  (exists ((i Int))
  (and (= i o)
  (ite (= (and (ite (<= o i) true false) (ite (<= i 100) true false)) true)
  (exists ((a13 (Array Int integer)) (i1 Int))
  (and
  (= (and (ite (forall ((temp___277 Int))
               (=> (and (<= 0 temp___277) (<= temp___277 100))
               (=>
               (or (< 100 temp___277)
               (or (< temp___277 o) (<= i1 temp___277)))
               (= (select a13 temp___277) (select a11 temp___277)))))
          true false) (ite (and (<= (+ k 1) i1) (<= i1 100)) true false)) true)
  (let ((o1 (- i1 k)))
  (and (in_range1 o1)
  (and (and (<= 0 o1) (<= o1 100))
  (exists ((o2 Int))
  (and (= (to_rep (select c1 o1)) o2)
  (exists ((o3 integer))
  (and (= (to_rep o3) o2)
  (and (and (<= 0 i1) (<= i1 100))
  (and (= a12 (store a13 i1 o3)) (= i1 100)))))))))))) (= a12 a11))))))
  (=> (<= 0 k) (<= 0 0))))))))))))
(check-sat)
(exit)
