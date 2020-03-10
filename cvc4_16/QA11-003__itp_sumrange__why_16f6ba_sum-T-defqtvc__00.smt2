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

(define-fun abs1 ((x Int)) Int (ite (<= 0 x) x (- x)))

;; Abs_le
  (assert
  (forall ((x Int) (y Int)) (= (<= (abs1 x) y) (and (<= (- y) x) (<= x y)))))

;; Abs_pos
  (assert (forall ((x Int)) (<= 0 (abs1 x))))

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

(declare-sort bounded_integer 0)

(declare-fun bounded_integerqtint (bounded_integer) Int)

;; bounded_integer'axiom
  (assert
  (forall ((i bounded_integer))
  (and (<= (- 2000) (bounded_integerqtint i))
  (<= (bounded_integerqtint i) 2000))))

(define-fun in_range2 ((x Int)) Bool (and (<= (- 2000) x) (<= x 2000)))

(declare-fun attr__ATTRIBUTE_IMAGE2 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check2 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE2 (us_image) Int)

(declare-fun user_eq1 (bounded_integer bounded_integer) Bool)

(declare-const dummy1 bounded_integer)

(declare-datatypes ((bounded_integer__ref 0))
(((bounded_integer__refqtmk (bounded_integer__content bounded_integer)))))
(define-fun bounded_integer__ref_bounded_integer__content__projection ((a bounded_integer__ref)) bounded_integer 
  (bounded_integer__content a))

(define-fun to_rep ((x bounded_integer)) Int (bounded_integerqtint x))

(declare-fun of_rep (Int) bounded_integer)

;; inversion_axiom
  (assert
  (forall ((x bounded_integer))
  (! (= (of_rep (to_rep x)) x) :pattern ((to_rep x)) )))

;; range_axiom
  (assert
  (forall ((x bounded_integer)) (! (in_range2
  (to_rep x)) :pattern ((to_rep x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range2 x) (= (to_rep (of_rep x)) x)) :pattern ((to_rep
                                                            (of_rep x))) )))

(declare-datatypes ((map__ref 0))
(((map__refqtmk (map__content (Array Int bounded_integer))))))
(declare-fun slide ((Array Int bounded_integer) Int
  Int) (Array Int bounded_integer))

;; slide_eq
  (assert
  (forall ((a (Array Int bounded_integer)))
  (forall ((first Int))
  (! (= (slide a first first) a) :pattern ((slide a first first)) ))))

;; slide_def
  (assert
  (forall ((a (Array Int bounded_integer)))
  (forall ((old_first Int))
  (forall ((new_first Int))
  (forall ((i Int))
  (! (= (select (slide a old_first new_first) i) (select a (- i (- new_first old_first)))) :pattern ((select 
  (slide a old_first new_first) i)) ))))))

(define-fun bool_eq ((a (Array Int bounded_integer)) (a__first Int)
  (a__last Int) (b (Array Int bounded_integer)) (b__first Int)
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
  (forall ((a (Array Int bounded_integer)) (b (Array Int bounded_integer)))
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

(declare-fun sum ((Array Int bounded_integer) Int Int) Int)

(declare-fun sum__function_guard (Int (Array Int bounded_integer) Int
  Int) Bool)

(declare-sort index 0)

(declare-fun indexqtint (index) Int)

;; index'axiom
  (assert
  (forall ((i index)) (and (<= 0 (indexqtint i)) (<= (indexqtint i) 300))))

(define-fun in_range3 ((x Int)) Bool (and (<= 0 x) (<= x 300)))

(declare-fun attr__ATTRIBUTE_IMAGE3 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check3 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE3 (us_image) Int)

(declare-fun user_eq2 (index index) Bool)

(declare-const dummy2 index)

(declare-datatypes ((index__ref 0))
(((index__refqtmk (index__content index)))))
(define-fun index__ref_index__content__projection ((a index__ref)) index 
  (index__content a))

(define-fun dynamic_invariant1 ((temp___expr_161 Int)
  (temp___is_init_157 Bool) (temp___skip_constant_158 Bool)
  (temp___do_toplevel_159 Bool)
  (temp___do_typ_inv_160 Bool)) Bool (=>
                                     (or (= temp___is_init_157 true)
                                     (<= 0 300)) (in_range3 temp___expr_161)))

;; sum__def_axiom
  (assert
  (forall ((a (Array Int bounded_integer)))
  (forall ((i Int) (j Int))
  (! (=>
     (and (dynamic_invariant1 i true true true true) (dynamic_invariant1 j
     true true true true))
     (= (sum a i j) (ite (<= j i) 0
                    (+ (to_rep (select a i)) (sum a (+ i 1) j))))) :pattern (
  (sum a i j)) ))))

(declare-const a (Array Int bounded_integer))

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(declare-const i Int)

(declare-const attr__ATTRIBUTE_ADDRESS1 Int)

(declare-const j Int)

(declare-const attr__ATTRIBUTE_ADDRESS2 Int)

(declare-const attr__ATTRIBUTE_ADDRESS3 Int)

(declare-const attr__ATTRIBUTE_ADDRESS4 Int)

(define-fun to_rep1 ((x integer)) Int (integerqtint x))

(declare-fun of_rep1 (Int) integer)

;; inversion_axiom
  (assert
  (forall ((x integer))
  (! (= (of_rep1 (to_rep1 x)) x) :pattern ((to_rep1 x)) )))

;; range_axiom
  (assert
  (forall ((x integer)) (! (in_range1 (to_rep1 x)) :pattern ((to_rep1 x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range1 x) (= (to_rep1 (of_rep1 x)) x)) :pattern ((to_rep1
                                                              (of_rep1 x))) )))

(define-fun dynamic_property ((first_int Int) (last_int Int)
  (x Int)) Bool (and (<= first_int x) (<= x last_int)))

(declare-fun attr__ATTRIBUTE_IMAGE4 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check4 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE4 (us_image) Int)

(declare-fun user_eq3 (integer integer) Bool)

(declare-const dummy3 integer)

(declare-datatypes ((t1b__ref 0))
(((t1b__refqtmk (t1b__content integer)))))
(define-fun t1b__ref_t1b__content__projection ((a1 t1b__ref)) integer 
  (t1b__content a1))

(define-fun dynamic_invariant2 ((temp___expr_168 Int)
  (temp___is_init_164 Bool) (temp___skip_constant_165 Bool)
  (temp___do_toplevel_166 Bool)
  (temp___do_typ_inv_167 Bool)) Bool (=>
                                     (or (= temp___is_init_164 true)
                                     (<= (- 2000) 2000)) (in_range2
                                     temp___expr_168)))

;; sum__post_axiom
  (assert
  (forall ((a1 (Array Int bounded_integer)))
  (forall ((i1 Int) (j1 Int))
  (! (=>
     (and
     (and (dynamic_invariant1 i1 true true true true) (dynamic_invariant1 j1
     true true true true)) (<= i1 j1))
     (let ((result (sum a1 i1 j1)))
     (and (<= (abs1 result) (* (- j1 i1) 3000)) (dynamic_invariant result
     true false true true)))) :pattern ((sum a1 i1 j1)) ))))

(assert
;; defqtvc
 ;; File "sum.ads", line 34, characters 0-0
  (not
  (forall ((s Int))
  (=> (dynamic_invariant1 i true false true true)
  (=> (dynamic_invariant1 j true false true true)
  (=> (<= i j)
  (=> (= s 0)
  (=> (dynamic_invariant s true false true true)
  (let ((temp___186 i))
  (let ((temp___187 (- j 1)))
  (forall ((k Int))
  (=> (= k temp___186)
  (=>
  (= (and (ite (<= temp___186 k) true false) (ite (<= k temp___187) true
                                             false)) true)
  (=> (in_range1 (* k 2000))
  (=> (in_range1 (abs1 s))
  (forall ((s1 Int) (k1 Int))
  (=> (and (<= (abs1 s1) (* k1 2000)) (= s1 (sum a i k1)))
  (=>
  (= (and (ite (and (dynamic_invariant s1 true true true true)
               (dynamic_property i (- j 1) k1))
          true false) (ite (and (<= i k1) (<= k1 (- j 1))) true false)) true)
  (forall ((o Int))
  (=> (= (to_rep (select a k1)) o)
  (let ((o1 (+ s1 o)))
  (=> (in_range1 o1)
  (forall ((s2 Int))
  (=> (= s2 o1)
  (=> (not (= k1 temp___187))
  (forall ((k2 Int))
  (=> (= k2 (+ k1 1))
  (=> (in_range1 (* k2 2000))
  (=> (in_range1 (abs1 s2)) (=> (in_range3 k2) (<= i k2)))))))))))))))))))))))))))))))
(check-sat)
(exit)
