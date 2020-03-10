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

(declare-fun no_v_in_range ((Array Int integer) Int Int Int) Bool)

(declare-fun no_v_in_range__function_guard (Bool (Array Int integer) Int Int
  Int) Bool)

(declare-sort position 0)

(declare-fun positionqtint (position) Int)

;; position'axiom
  (assert
  (forall ((i position))
  (and (<= 1 (positionqtint i)) (<= (positionqtint i) 10))))

(define-fun in_range2 ((x Int)) Bool (and (<= 1 x) (<= x 10)))

(declare-fun attr__ATTRIBUTE_IMAGE2 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check2 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE2 (us_image) Int)

(declare-fun user_eq1 (position position) Bool)

(declare-const dummy1 position)

(declare-datatypes ((position__ref 0))
(((position__refqtmk (position__content position)))))
(define-fun position__ref_position__content__projection ((a position__ref)) position 
  (position__content a))

(define-fun dynamic_invariant1 ((temp___expr_161 Int)
  (temp___is_init_157 Bool) (temp___skip_constant_158 Bool)
  (temp___do_toplevel_159 Bool)
  (temp___do_typ_inv_160 Bool)) Bool (=>
                                     (or (= temp___is_init_157 true)
                                     (<= 1 10)) (in_range2 temp___expr_161)))

;; no_v_in_range__post_axiom
  (assert true)

;; no_v_in_range__def_axiom
  (assert
  (forall ((t (Array Int integer)))
  (forall ((v Int) (low Int) (up Int))
  (! (= (= (no_v_in_range t v low up) true)
     (forall ((pos Int))
     (=> (and (<= low pos) (<= pos up)) (not (= (to_rep (select t pos)) v))))) :pattern (
  (no_v_in_range t v low up)) ))))

(declare-const t (Array Int integer))

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(declare-const v Int)

(declare-const attr__ATTRIBUTE_ADDRESS1 Int)

(declare-const attr__ATTRIBUTE_ADDRESS2 Int)

(declare-const attr__ATTRIBUTE_ADDRESS3 Int)

(declare-sort t1b 0)

(declare-fun t1bqtint (t1b) Int)

;; t1b'axiom
  (assert (forall ((i t1b)) (and (<= 1 (t1bqtint i)) (<= (t1bqtint i) 10))))

(define-fun in_range3 ((x Int)) Bool (and (<= 1 x) (<= x 10)))

(declare-fun attr__ATTRIBUTE_IMAGE3 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check3 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE3 (us_image) Int)

(declare-fun user_eq2 (t1b t1b) Bool)

(declare-const dummy2 t1b)

(declare-datatypes ((t1b__ref 0))
(((t1b__refqtmk (t1b__content t1b)))))
(define-fun t1b__ref_t1b__content__projection ((a t1b__ref)) t1b (t1b__content
                                                                 a))

(assert
;; defqtvc
 ;; File "search.ads", line 6, characters 0-0
  (not
  (forall ((pos Int) (pos1 Int) (search__search__result Int))
  (=> (dynamic_invariant v true false true true)
  (=> (= pos 0)
  (=> (dynamic_invariant pos true false true true)
  (=>
  (exists ((i Int))
  (and (= i 1)
  (ite (= (and (ite (<= 1 i) true false) (ite (<= i 10) true false)) true)
  (and
  (exists ((o Bool))
  (and
  (ite (= pos 0)
  (= o (ite (forall ((j Int))
            (=> (and (<= 1 j) (<= j (- i 1)))
            (not (= (to_rep (select t j)) v))))
       true false))
  (= o false))
  (or (= o true)
  (and (and (<= 1 pos) (<= pos 10))
  (exists ((o1 Int))
  (and (= (to_rep (select t pos)) o1)
  (or (not (= o1 v)) (in_range1 (- pos 1)))))))))
  (exists ((pos2 Int) (i1 Int))
  (and
  (or
  (and (= pos2 0)
  (forall ((j Int))
  (=> (and (<= 1 j) (<= j (- i1 1))) (not (= (to_rep (select t j)) v)))))
  (and (= (to_rep (select t pos2)) v)
  (forall ((j Int))
  (=> (and (<= 1 j) (<= j (- pos2 1))) (not (= (to_rep (select t j)) v))))))
  (and
  (= (and (ite (and (dynamic_invariant pos2 true true true true) (in_range3
               i1))
          true false) (ite (and (<= 1 i1) (<= i1 10)) true false)) true)
  (and
  (exists ((o Int))
  (and (= (to_rep (select t i1)) o)
  (exists ((spark__branch Bool))
  (and (= spark__branch (ite (= o v) true false))
  (ite (= spark__branch true) (= pos1 i1) (= pos1 pos2)))))) (= i1 10))))))
  (= pos1 pos))))
  (=> (= search__search__result pos1)
  (or
  (and (= search__search__result 0)
  (=> (no_v_in_range__function_guard (no_v_in_range t v 1 10) t v 1 10)
  (= (no_v_in_range t v 1 10) true)))
  (and (= (to_rep (select t search__search__result)) v)
  (=>
  (forall ((search__search__result1 Int)) (no_v_in_range__function_guard
  (no_v_in_range t v 1 (- search__search__result1 1)) t v 1
  (- search__search__result1 1)))
  (= (no_v_in_range t v 1 (- search__search__result 1)) true))))))))))))
(check-sat)
(exit)
