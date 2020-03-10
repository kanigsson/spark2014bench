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

(declare-sort natural 0)

(declare-fun naturalqtint (natural) Int)

;; natural'axiom
  (assert
  (forall ((i natural))
  (and (<= 0 (naturalqtint i)) (<= (naturalqtint i) 2147483647))))

(define-fun in_range1 ((x Int)) Bool (and (<= 0 x) (<= x 2147483647)))

(declare-fun attr__ATTRIBUTE_IMAGE1 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check1 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE1 (us_image) Int)

(declare-fun user_eq (natural natural) Bool)

(declare-const dummy natural)

(declare-datatypes ((natural__ref 0))
(((natural__refqtmk (natural__content natural)))))
(define-fun natural__ref_natural__content__projection ((a natural__ref)) natural 
  (natural__content a))

(define-fun to_rep ((x natural)) Int (naturalqtint x))

(declare-fun of_rep (Int) natural)

;; inversion_axiom
  (assert
  (forall ((x natural)) (! (= (of_rep (to_rep x)) x) :pattern ((to_rep x)) )))

;; range_axiom
  (assert
  (forall ((x natural)) (! (in_range1 (to_rep x)) :pattern ((to_rep x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range1 x) (= (to_rep (of_rep x)) x)) :pattern ((to_rep
                                                            (of_rep x))) )))

(declare-datatypes ((map__ref 0))
(((map__refqtmk (map__content (Array Int natural))))))
(declare-fun slide ((Array Int natural) Int Int) (Array Int natural))

;; slide_eq
  (assert
  (forall ((a (Array Int natural)))
  (forall ((first Int))
  (! (= (slide a first first) a) :pattern ((slide a first first)) ))))

;; slide_def
  (assert
  (forall ((a (Array Int natural)))
  (forall ((old_first Int))
  (forall ((new_first Int))
  (forall ((i Int))
  (! (= (select (slide a old_first new_first) i) (select a (- i (- new_first old_first)))) :pattern ((select 
  (slide a old_first new_first) i)) ))))))

(define-fun bool_eq ((a (Array Int natural)) (a__first Int) (a__last Int)
  (b (Array Int natural)) (b__first Int)
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
  (forall ((a (Array Int natural)) (b (Array Int natural)))
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

(define-fun dynamic_invariant ((temp___expr_39 Int) (temp___is_init_35 Bool)
  (temp___skip_constant_36 Bool) (temp___do_toplevel_37 Bool)
  (temp___do_typ_inv_38 Bool)) Bool (=>
                                    (or (= temp___is_init_35 true)
                                    (<= 0 2147483647)) (in_range1
                                    temp___expr_39)))

(declare-fun ident (Int) Int)

(declare-fun ident__function_guard (Int Int) Bool)

;; ident__post_axiom
  (assert
  (forall ((y Int))
  (! (=> (dynamic_invariant y true true true true)
     (let ((result (ident y)))
     (=> (ident__function_guard result y) (dynamic_invariant result true
     false true true)))) :pattern ((ident y)) )))

(assert
;; defqtvc
 ;; File "array_arith.ads", line 8, characters 0-0
  (not
  (forall ((x (Array Int natural)))
  (let ((o (ident 1)))
  (=>
  (and (ident__function_guard o 1) (dynamic_invariant o true false true
  true))
  (forall ((o1 natural))
  (=> (= (to_rep o1) o)
  (forall ((x1 (Array Int natural)))
  (=> (= x1 (store x 1 o1))
  (let ((o2 (ident 2)))
  (=>
  (and (ident__function_guard o2 2) (dynamic_invariant o2 true false true
  true))
  (forall ((o3 natural))
  (=> (= (to_rep o3) o2)
  (forall ((x2 (Array Int natural)))
  (=> (= x2 (store x1 2 o3))
  (let ((o4 (ident 3)))
  (=>
  (and (ident__function_guard o4 3) (dynamic_invariant o4 true false true
  true))
  (forall ((o5 natural))
  (=> (= (to_rep o5) o4)
  (forall ((x3 (Array Int natural)))
  (=> (= x3 (store x2 3 o5))
  (let ((o6 (ident 4)))
  (=>
  (and (ident__function_guard o6 4) (dynamic_invariant o6 true false true
  true))
  (forall ((o7 natural))
  (=> (= (to_rep o7) o6)
  (forall ((x4 (Array Int natural)))
  (=> (= x4 (store x3 4 o7))
  (let ((o8 (ident 5)))
  (=>
  (and (ident__function_guard o8 5) (dynamic_invariant o8 true false true
  true))
  (forall ((o9 natural))
  (=> (= (to_rep o9) o8)
  (forall ((x5 (Array Int natural)))
  (=> (= x5 (store x4 5 o9))
  (let ((o10 (ident 6)))
  (=>
  (and (ident__function_guard o10 6) (dynamic_invariant o10 true false true
  true))
  (forall ((o11 natural))
  (=> (= (to_rep o11) o10)
  (forall ((x6 (Array Int natural)))
  (=> (= x6 (store x5 6 o11))
  (let ((o12 (ident 7)))
  (=>
  (and (ident__function_guard o12 7) (dynamic_invariant o12 true false true
  true))
  (forall ((o13 natural))
  (=> (= (to_rep o13) o12)
  (forall ((x7 (Array Int natural)))
  (=> (= x7 (store x6 7 o13))
  (let ((o14 (ident 8)))
  (=>
  (and (ident__function_guard o14 8) (dynamic_invariant o14 true false true
  true))
  (forall ((o15 natural))
  (=> (= (to_rep o15) o14)
  (forall ((x8 (Array Int natural)))
  (=> (= x8 (store x7 8 o15))
  (let ((o16 (ident 9)))
  (=>
  (and (ident__function_guard o16 9) (dynamic_invariant o16 true false true
  true))
  (forall ((o17 natural))
  (=> (= (to_rep o17) o16)
  (forall ((x9 (Array Int natural)))
  (=> (= x9 (store x8 9 o17))
  (let ((o18 (ident 10)))
  (=>
  (and (ident__function_guard o18 10) (dynamic_invariant o18 true false true
  true))
  (forall ((o19 natural))
  (=> (= (to_rep o19) o18)
  (forall ((x10 (Array Int natural)))
  (=> (= x10 (store x9 10 o19))
  (forall ((j Int))
  (=> (and (<= 1 j) (<= j 10)) (= (to_rep (select x10 j)) j))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))
(check-sat)
(exit)
