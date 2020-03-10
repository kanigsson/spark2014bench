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

(declare-sort positive 0)

(declare-fun positiveqtint (positive) Int)

;; positive'axiom
  (assert
  (forall ((i positive))
  (and (<= 1 (positiveqtint i)) (<= (positiveqtint i) 2147483647))))

(define-fun in_range2 ((x Int)) Bool (and (<= 1 x) (<= x 2147483647)))

(declare-fun attr__ATTRIBUTE_IMAGE2 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check2 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE2 (us_image) Int)

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
                                    (<= 1 2147483647)) (in_range2
                                    temp___expr_46)))

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

(declare-sort t 0)

(declare-fun first (t) integer)

(declare-fun last (t) integer)

(declare-fun mk (Int Int) t)

;; mk_def
  (assert
  (forall ((f Int) (l Int))
  (! (=> (in_range1 f)
     (=> (in_range1 l)
     (and (= (to_rep (first (mk f l))) f) (= (to_rep (last (mk f l))) l)))) :pattern (
  (mk f l)) )))

(define-fun dynamic_property ((range_first Int) (range_last Int) (low Int)
  (high Int)) Bool (and (in_range1 low)
                   (and (in_range1 high)
                   (=> (<= low high) (and (in_range2 low) (in_range2 high))))))

(declare-datatypes ((us_t 0))
(((us_tqtmk (elts (Array Int integer))(rt t)))))
(define-fun to_array ((a us_t)) (Array Int integer) (elts a))

(define-fun of_array ((a (Array Int integer)) (f Int)
  (l Int)) us_t (us_tqtmk a (mk f l)))

(define-fun first1 ((a us_t)) Int (to_rep (first (rt a))))

(define-fun last1 ((a us_t)) Int (to_rep (last (rt a))))

(define-fun length ((a us_t)) Int (ite (<= (first1 a) (last1 a))
                                  (+ (- (last1 a) (first1 a)) 1) 0))

(declare-const value__size Int)

(declare-const object__size Int)

(declare-const component__size Int)

(declare-const alignment Int)

;; value__size_axiom
  (assert (<= 0 value__size))

;; object__size_axiom
  (assert (<= 0 object__size))

;; component__size_axiom
  (assert (<= 0 component__size))

;; alignment_axiom
  (assert (<= 0 alignment))

(define-fun bool_eq1 ((x us_t)
  (y us_t)) Bool (bool_eq (elts x) (to_rep (first (rt x)))
                 (to_rep (last (rt x))) (elts y) (to_rep (first (rt y)))
                 (to_rep (last (rt y)))))

(declare-fun user_eq2 (us_t us_t) Bool)

(declare-const dummy2 us_t)

(declare-datatypes ((int_array__ref 0))
(((int_array__refqtmk (int_array__content us_t)))))
(define-fun int_array__ref_int_array__content__projection ((a int_array__ref)) us_t 
  (int_array__content a))

(declare-const s1 us_t)

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(declare-const s2 us_t)

(declare-const attr__ATTRIBUTE_ADDRESS1 Int)

(declare-const attr__ATTRIBUTE_ADDRESS2 Int)

(declare-const attr__ATTRIBUTE_ADDRESS3 Int)

(declare-const attr__ATTRIBUTE_ADDRESS4 Int)

(declare-const r__first integer)

(declare-const r__last integer)

(declare-const attr__ATTRIBUTE_ADDRESS5 Int)

(define-fun dynamic_invariant1 ((temp___expr_171 us_t)
  (temp___is_init_167 Bool) (temp___skip_constant_168 Bool)
  (temp___do_toplevel_169 Bool)
  (temp___do_typ_inv_170 Bool)) Bool (and
                                     (=>
                                     (not (= temp___skip_constant_168 true))
                                     (dynamic_property 1 2147483647
                                     (first1 temp___expr_171)
                                     (last1 temp___expr_171)))
                                     (=> (= temp___do_toplevel_169 true)
                                     (=> (= temp___is_init_167 true)
                                     (= (first1 temp___expr_171) 1)))))

(define-fun dynamic_predicate ((temp___174 us_t)) Bool (= (first1 temp___174) 1))

(declare-datatypes ((trS__ref 0))
(((trS__refqtmk (trS__content us_t)))))
(define-fun trS__ref_trS__content__projection ((a trS__ref)) us_t (trS__content
                                                                  a))

(declare-datatypes ((t40b__ref 0))
(((t40b__refqtmk (t40b__content us_t)))))
(define-fun t40b__ref_t40b__content__projection ((a t40b__ref)) us_t 
  (t40b__content a))

(define-fun dynamic_invariant2 ((temp___expr_253 us_t)
  (temp___is_init_249 Bool) (temp___skip_constant_250 Bool)
  (temp___do_toplevel_251 Bool)
  (temp___do_typ_inv_252 Bool)) Bool (and
                                     (=>
                                     (not (= temp___skip_constant_250 true))
                                     (and (dynamic_property 1
                                     (+ (length s1) (length s2))
                                     (first1 temp___expr_253)
                                     (last1 temp___expr_253))
                                     (and (= (first1 temp___expr_253) 1)
                                     (= (last1 temp___expr_253) (+ (length
                                                                   s1) 
                                     (length s2))))))
                                     (=> (= temp___is_init_249 true)
                                     (= (first1 temp___expr_253) 1))))

(define-fun default_initial_assumption ((temp___expr_257 us_t)
  (temp___skip_top_level_258 Bool)) Bool (and (= (first1 temp___expr_257) 1)
                                         (= (last1 temp___expr_257) (+ 
                                         (length s1) (length s2)))))

(define-fun dynamic_predicate1 ((temp___261 us_t)) Bool (= (first1
                                                           temp___261) 1))

(define-fun dynamic_predicate2 ((temp___263 us_t)) Bool (= (first1
                                                           temp___263) 1))

(declare-fun temp_____aggregate_def_495 (Int Int Int) us_t)

(define-fun dynamic_invariant3 ((temp___expr_18 Int) (temp___is_init_14 Bool)
  (temp___skip_constant_15 Bool) (temp___do_toplevel_16 Bool)
  (temp___do_typ_inv_17 Bool)) Bool (=>
                                    (or (= temp___is_init_14 true)
                                    (<= (- 2147483648) 2147483647))
                                    (in_range1 temp___expr_18)))

(declare-const rliteral integer)

;; rliteral_axiom
  (assert (= (integerqtint rliteral) 0))

;; def_axiom
  (assert
  (forall ((temp___497 Int) (temp___498 Int) (temp___499 Int))
  (let ((temp___496 (temp_____aggregate_def_495 temp___497 temp___498
                    temp___499)))
  (=> (dynamic_invariant3 temp___497 true true true true)
  (and
  (=> (dynamic_property 1 2147483647 temp___498 temp___499)
  (and (= (first1 temp___496) temp___498) (= (last1 temp___496) temp___499)))
  (forall ((temp___500 Int))
  (= (select (to_array temp___496) temp___500) rliteral)))))))

(assert
;; defqtvc
 ;; File "ghc_sort.ads", line 36, characters 0-0
  (not
  (forall ((r (Array Int integer)) (j1 Int) (j2 Int) (j Int))
  (=> (dynamic_invariant1 s1 true false true true)
  (=> (dynamic_invariant1 s2 true false true true)
  (=> (< (length s1) (- 2147483647 (length s2)))
  (=>
  (forall ((l Int))
  (=> (and (<= 2 l) (<= l (last1 s1)))
  (<= (to_rep (select (to_array s1) (- l 1))) (to_rep
                                              (select (to_array s1) l)))))
  (=>
  (forall ((l Int))
  (=> (and (<= 2 l) (<= l (last1 s2)))
  (<= (to_rep (select (to_array s2) (- l 1))) (to_rep
                                              (select (to_array s2) l)))))
  (=> (= j1 1)
  (=> (dynamic_invariant j1 true false true true)
  (=> (= j2 1)
  (=> (dynamic_invariant j2 true false true true)
  (=> (= j 1)
  (=> (dynamic_invariant j true false true true)
  (=> (default_initial_assumption
  (of_array r (to_rep r__first) (to_rep r__last)) false)
  (=>
  (and (dynamic_property 1 (+ (length s1) (length s2)) (to_rep r__first)
  (to_rep r__last))
  (and (= (to_rep r__first) 1)
  (= (to_rep r__last) (+ (length s1) (length s2)))))
  (let ((temp___501 (temp_____aggregate_def_495 0 1
                    (+ (length s1) (length s2)))))
  (=> (= (first1 temp___501) 1)
  (=> (= (last1 temp___501) (+ (length s1) (length s2)))
  (=> (dynamic_predicate2 temp___501)
  (=>
  (ite (<= (first1 temp___501) (last1 temp___501))
  (and (<= 1 (+ (length s1) (length s2)))
  (= (- (last1 temp___501) (first1 temp___501)) (- (+ (length s1) (length s2)) 1)))
  (< (+ (length s1) (length s2)) 1))
  (let ((temp___504 (of_array (to_array temp___501) (first1 temp___501)
                    (last1 temp___501))))
  (=> (dynamic_predicate1 temp___504)
  (=>
  (ite (<= (first1 temp___504) (last1 temp___504))
  (and (<= (to_rep r__first) (to_rep r__last))
  (= (- (last1 temp___504) (first1 temp___504)) (- (to_rep r__last) (to_rep
                                                                    r__first))))
  (< (to_rep r__last) (to_rep r__first)))
  (forall ((r1 (Array Int integer)))
  (=> (= r1 (to_array temp___504))
  (forall ((o Bool))
  (=>
  (ite (= (and (ite (<= (first1 s1) j1) true false) (ite (<= j1 (last1 s1))
                                                    true false)) true)
  (= o (and (ite (<= (first1 s2) j2) true false) (ite (<= j2 (last1 s2)) true
                                                 false)))
  (= o false))
  (=> (= o true)
  (=> (in_range1 (+ j1 j2))
  (forall ((j11 Int) (j21 Int) (j3 Int) (r2 (Array Int integer)))
  (=>
  (and (= j3 (- (+ j11 j21) 1))
  (and
  (=> (< 1 j3)
  (<= (to_rep (select r2 (- j3 1))) (to_rep (select (to_array s1) j11))))
  (and
  (=> (< 1 j3)
  (<= (to_rep (select r2 (- j3 1))) (to_rep (select (to_array s2) j21))))
  (forall ((l Int))
  (=> (and (<= 2 l) (<= l (- j3 1)))
  (<= (to_rep (select r2 (- l 1))) (to_rep (select r2 l))))))))
  (=>
  (= (and (ite (and
               (and (dynamic_invariant j21 true true true true)
               (dynamic_invariant j3 true true true true)) (dynamic_invariant
               j11 true true true true))
          true false) (ite (and
                           (and (<= (first1 s1) j11) (<= j11 (last1 s1)))
                           (and (<= (first1 s2) j21) (<= j21 (last1 s2))))
                      true false)) true)
  (forall ((j12 Int) (j22 Int) (r3 (Array Int integer)))
  (=>
  (and (and (<= (first1 s2) j21) (<= j21 (last1 s2)))
  (exists ((o1 Int))
  (and (= (to_rep (select (to_array s2) j21)) o1)
  (and (and (<= (first1 s1) j11) (<= j11 (last1 s1)))
  (exists ((o2 Int))
  (and (= (to_rep (select (to_array s1) j11)) o2)
  (exists ((spark__branch Bool))
  (and (= spark__branch (ite (< o2 o1) true false))
  (ite (= spark__branch true)
  (and
  (and (and (<= (first1 s1) j11) (<= j11 (last1 s1)))
  (exists ((o3 Int))
  (and (= (to_rep (select (to_array s1) j11)) o3)
  (exists ((o4 integer))
  (and (= (to_rep o4) o3)
  (and (and (<= (to_rep r__first) j3) (<= j3 (to_rep r__last)))
  (and (= (to_rep r__first) 1)
  (and (= r3 (store r2 j3 o4))
  (let ((o5 (+ j11 1))) (and (in_range1 o5) (= j12 o5))))))))))) (= j22 j21))
  (and
  (and (and (<= (first1 s2) j21) (<= j21 (last1 s2)))
  (exists ((o3 Int))
  (and (= (to_rep (select (to_array s2) j21)) o3)
  (exists ((o4 integer))
  (and (= (to_rep o4) o3)
  (and (and (<= (to_rep r__first) j3) (<= j3 (to_rep r__last)))
  (and (= (to_rep r__first) 1)
  (and (= r3 (store r2 j3 o4))
  (let ((o5 (+ j21 1))) (and (in_range1 o5) (= j22 o5))))))))))) (= j12 j11)))))))))))
  (let ((o1 (+ j3 1)))
  (=> (in_range1 o1)
  (forall ((j4 Int))
  (=> (= j4 o1)
  (forall ((o2 Bool))
  (=>
  (ite (= (and (ite (<= (first1 s1) j12) true false) (ite (<= j12 (last1 s1))
                                                     true false)) true)
  (= o2 (and (ite (<= (first1 s2) j22) true false) (ite (<= j22 (last1 s2))
                                                   true false)))
  (= o2 false))
  (=> (= o2 true) (=> (in_range1 (+ j12 j22)) (= j4 (- (+ j12 j22) 1)))))))))))))))))))))))))))))))))))))))))))))
(check-sat)
(exit)
