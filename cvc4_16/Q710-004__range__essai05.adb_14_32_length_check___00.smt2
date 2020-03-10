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

(declare-sort tindex_aB 0)

(declare-fun tindex_aBqtint (tindex_aB) Int)

;; tindex_aB'axiom
  (assert
  (forall ((i tindex_aB))
  (and (<= (- 128) (tindex_aBqtint i)) (<= (tindex_aBqtint i) 127))))

(define-fun in_range2 ((x Int)) Bool (and (<= (- 128) x) (<= x 127)))

(declare-fun attr__ATTRIBUTE_IMAGE2 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check2 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE2 (us_image) Int)

(declare-fun user_eq1 (tindex_aB tindex_aB) Bool)

(declare-const dummy1 tindex_aB)

(declare-datatypes ((tindex_aB__ref 0))
(((tindex_aB__refqtmk (tindex_aB__content tindex_aB)))))
(define-fun tindex_aB__ref_tindex_aB__content__projection ((a tindex_aB__ref)) tindex_aB 
  (tindex_aB__content a))

(define-fun to_rep1 ((x tindex_aB)) Int (tindex_aBqtint x))

(declare-fun of_rep1 (Int) tindex_aB)

;; inversion_axiom
  (assert
  (forall ((x tindex_aB))
  (! (= (of_rep1 (to_rep1 x)) x) :pattern ((to_rep1 x)) )))

;; range_axiom
  (assert
  (forall ((x tindex_aB)) (! (in_range2
  (to_rep1 x)) :pattern ((to_rep1 x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range2 x) (= (to_rep1 (of_rep1 x)) x)) :pattern ((to_rep1
                                                              (of_rep1 x))) )))

(declare-sort index_a 0)

(declare-fun index_aqtint (index_a) Int)

;; index_a'axiom
  (assert
  (forall ((i index_a))
  (and (<= (- 3) (index_aqtint i)) (<= (index_aqtint i) 15))))

(define-fun in_range3 ((x Int)) Bool (and (<= (- 3) x) (<= x 15)))

(declare-fun attr__ATTRIBUTE_IMAGE3 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check3 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE3 (us_image) Int)

(declare-fun user_eq2 (index_a index_a) Bool)

(declare-const dummy2 index_a)

(declare-datatypes ((index_a__ref 0))
(((index_a__refqtmk (index_a__content index_a)))))
(define-fun index_a__ref_index_a__content__projection ((a index_a__ref)) index_a 
  (index_a__content a))

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

(declare-fun first (t) tindex_aB)

(declare-fun last (t) tindex_aB)

(declare-fun mk (Int Int) t)

;; mk_def
  (assert
  (forall ((f Int) (l Int))
  (! (=> (in_range2 f)
     (=> (in_range2 l)
     (and (= (to_rep1 (first (mk f l))) f) (= (to_rep1 (last (mk f l))) l)))) :pattern (
  (mk f l)) )))

(define-fun dynamic_property ((range_first Int) (range_last Int) (low Int)
  (high Int)) Bool (and (in_range2 low)
                   (and (in_range2 high)
                   (=> (<= low high) (and (in_range3 low) (in_range3 high))))))

(declare-datatypes ((us_t 0))
(((us_tqtmk (elts (Array Int integer))(rt t)))))
(define-fun to_array ((a us_t)) (Array Int integer) (elts a))

(define-fun of_array ((a (Array Int integer)) (f Int)
  (l Int)) us_t (us_tqtmk a (mk f l)))

(define-fun first1 ((a us_t)) Int (to_rep1 (first (rt a))))

(define-fun last1 ((a us_t)) Int (to_rep1 (last (rt a))))

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
  (y us_t)) Bool (bool_eq (elts x) (to_rep1 (first (rt x)))
                 (to_rep1 (last (rt x))) (elts y) (to_rep1 (first (rt y)))
                 (to_rep1 (last (rt y)))))

(declare-fun user_eq3 (us_t us_t) Bool)

(declare-const dummy3 us_t)

(declare-datatypes ((array_a__ref 0))
(((array_a__refqtmk (array_a__content us_t)))))
(define-fun array_a__ref_array_a__content__projection ((a array_a__ref)) us_t 
  (array_a__content a))

(declare-sort index_b 0)

(declare-fun index_bqtint (index_b) Int)

;; index_b'axiom
  (assert
  (forall ((i index_b))
  (and (<= 3 (index_bqtint i)) (<= (index_bqtint i) 15))))

(define-fun in_range4 ((x Int)) Bool (and (<= 3 x) (<= x 15)))

(declare-fun attr__ATTRIBUTE_IMAGE4 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check4 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE4 (us_image) Int)

(declare-fun user_eq4 (index_b index_b) Bool)

(declare-const dummy4 index_b)

(declare-datatypes ((index_b__ref 0))
(((index_b__refqtmk (index_b__content index_b)))))
(define-fun index_b__ref_index_b__content__projection ((a index_b__ref)) index_b 
  (index_b__content a))

(declare-sort t1 0)

(declare-fun first2 (t1) tindex_aB)

(declare-fun last2 (t1) tindex_aB)

(declare-fun mk1 (Int Int) t1)

;; mk_def
  (assert
  (forall ((f Int) (l Int))
  (! (=> (in_range2 f)
     (=> (in_range2 l)
     (and (= (to_rep1 (first2 (mk1 f l))) f)
     (= (to_rep1 (last2 (mk1 f l))) l)))) :pattern ((mk1 f l)) )))

(define-fun dynamic_property1 ((range_first Int) (range_last Int) (low Int)
  (high Int)) Bool (and (in_range2 low)
                   (and (in_range2 high)
                   (=> (<= low high) (and (in_range4 low) (in_range4 high))))))

(declare-datatypes ((us_t1 0))
(((us_tqtmk1 (elts1 (Array Int integer))(rt1 t1)))))
(define-fun to_array1 ((a us_t1)) (Array Int integer) (elts1 a))

(define-fun of_array1 ((a (Array Int integer)) (f Int)
  (l Int)) us_t1 (us_tqtmk1 a (mk1 f l)))

(define-fun first3 ((a us_t1)) Int (to_rep1 (first2 (rt1 a))))

(define-fun last3 ((a us_t1)) Int (to_rep1 (last2 (rt1 a))))

(define-fun length1 ((a us_t1)) Int (ite (<= (first3 a) (last3 a))
                                    (+ (- (last3 a) (first3 a)) 1) 0))

(declare-const value__size1 Int)

(declare-const object__size1 Int)

(declare-const component__size1 Int)

(declare-const alignment1 Int)

;; value__size_axiom
  (assert (<= 0 value__size1))

;; object__size_axiom
  (assert (<= 0 object__size1))

;; component__size_axiom
  (assert (<= 0 component__size1))

;; alignment_axiom
  (assert (<= 0 alignment1))

(define-fun bool_eq2 ((x us_t1)
  (y us_t1)) Bool (bool_eq (elts1 x) (to_rep1 (first2 (rt1 x)))
                  (to_rep1 (last2 (rt1 x))) (elts1 y)
                  (to_rep1 (first2 (rt1 y))) (to_rep1 (last2 (rt1 y)))))

(declare-fun user_eq5 (us_t1 us_t1) Bool)

(declare-const dummy5 us_t1)

(declare-datatypes ((array_b__ref 0))
(((array_b__refqtmk (array_b__content us_t1)))))
(define-fun array_b__ref_array_b__content__projection ((a array_b__ref)) us_t1 
  (array_b__content a))

(declare-const v us_t)

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(declare-const r__first tindex_aB)

(declare-const r__last tindex_aB)

(declare-const attr__ATTRIBUTE_ADDRESS1 Int)

(declare-const attr__ATTRIBUTE_ADDRESS2 Int)

(define-fun dynamic_invariant ((temp___expr_196 us_t)
  (temp___is_init_192 Bool) (temp___skip_constant_193 Bool)
  (temp___do_toplevel_194 Bool)
  (temp___do_typ_inv_195 Bool)) Bool (=>
                                     (not (= temp___skip_constant_193 true))
                                     (dynamic_property (- 3) 15
                                     (first1 temp___expr_196)
                                     (last1 temp___expr_196))))

(declare-datatypes ((trS__ref 0))
(((trS__refqtmk (trS__content us_t1)))))
(define-fun trS__ref_trS__content__projection ((a trS__ref)) us_t1 (trS__content
                                                                   a))

(declare-datatypes ((t12b__ref 0))
(((t12b__refqtmk (t12b__content us_t1)))))
(define-fun t12b__ref_t12b__content__projection ((a t12b__ref)) us_t1 
  (t12b__content a))

(declare-fun essai05__conv__r__aggregate_def (Int Int Int) us_t1)

(define-fun dynamic_invariant1 ((temp___expr_18 Int) (temp___is_init_14 Bool)
  (temp___skip_constant_15 Bool) (temp___do_toplevel_16 Bool)
  (temp___do_typ_inv_17 Bool)) Bool (=>
                                    (or (= temp___is_init_14 true)
                                    (<= (- 2147483648) 2147483647))
                                    (in_range1 temp___expr_18)))

(define-fun dynamic_invariant2 ((temp___expr_182 Int)
  (temp___is_init_178 Bool) (temp___skip_constant_179 Bool)
  (temp___do_toplevel_180 Bool)
  (temp___do_typ_inv_181 Bool)) Bool (=>
                                     (or (= temp___is_init_178 true)
                                     (<= (- 3) 15)) (in_range3
                                     temp___expr_182)))

(define-fun dynamic_invariant3 ((temp___expr_189 Int)
  (temp___is_init_185 Bool) (temp___skip_constant_186 Bool)
  (temp___do_toplevel_187 Bool)
  (temp___do_typ_inv_188 Bool)) Bool (=>
                                     (or (= temp___is_init_185 true)
                                     (<= 3 15)) (in_range4 temp___expr_189)))

(define-fun dynamic_invariant4 ((temp___expr_202 us_t1)
  (temp___is_init_198 Bool) (temp___skip_constant_199 Bool)
  (temp___do_toplevel_200 Bool)
  (temp___do_typ_inv_201 Bool)) Bool (=>
                                     (not (= temp___skip_constant_199 true))
                                     (dynamic_property1 3 15
                                     (first3 temp___expr_202)
                                     (last3 temp___expr_202))))

(declare-const rliteral integer)

;; rliteral_axiom
  (assert (= (integerqtint rliteral) 0))

;; def_axiom
  (assert
  (forall ((temp___265 Int) (temp___266 Int) (temp___267 Int))
  (let ((temp___264 (essai05__conv__r__aggregate_def temp___265 temp___266
                    temp___267)))
  (=> (dynamic_invariant1 temp___265 true true true true)
  (and
  (=> (dynamic_property1 3 15 temp___266 temp___267)
  (and (= (first3 temp___264) temp___266) (= (last3 temp___264) temp___267)))
  (forall ((temp___268 Int))
  (= (select (to_array1 temp___264) temp___268) rliteral)))))))

(define-fun dynamic_invariant5 ((temp___expr_218 us_t1)
  (temp___is_init_214 Bool) (temp___skip_constant_215 Bool)
  (temp___do_toplevel_216 Bool)
  (temp___do_typ_inv_217 Bool)) Bool (=>
                                     (not (= temp___skip_constant_215 true))
                                     (and (dynamic_property1 (first1 v)
                                     (last1 v) (first3 temp___expr_218)
                                     (last3 temp___expr_218))
                                     (and
                                     (= (first3 temp___expr_218) (first1 v))
                                     (= (last3 temp___expr_218) (last1 v))))))

(define-fun default_initial_assumption ((temp___expr_220 us_t1)
  (temp___skip_top_level_221 Bool)) Bool (and
                                         (= (first3 temp___expr_220) 
                                         (first1 v))
                                         (= (last3 temp___expr_220) (last1 v))))

(assert
;; defqtvc
 ;; File "essai05.adb", line 13, characters 0-0
  (not
  (=> (dynamic_invariant v true false true true)
  (let ((temp___269 (essai05__conv__r__aggregate_def 0 (first1 v) (last1 v))))
  (=> (= (first3 temp___269) (first1 v))
  (=> (= (last3 temp___269) (last1 v))
  (=> (<= (first3 temp___269) (last3 temp___269)) (<= (first1 v) (last1 v)))))))))
(check-sat)
(exit)
