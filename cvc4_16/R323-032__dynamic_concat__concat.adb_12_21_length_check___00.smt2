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

(define-fun length ((x Int) (y Int)) Int (ite (<= x y) (+ (- y x) 1) 0))

(declare-sort natural 0)

(declare-fun naturalqtint (natural) Int)

;; natural'axiom
  (assert
  (forall ((i natural))
  (and (<= 0 (naturalqtint i)) (<= (naturalqtint i) 2147483647))))

(define-fun in_range ((x Int)) Bool (and (<= 0 x) (<= x 2147483647)))

(declare-fun attr__ATTRIBUTE_IMAGE (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE (us_image) Int)

(declare-fun user_eq (natural natural) Bool)

(declare-const dummy natural)

(declare-datatypes ((natural__ref 0))
(((natural__refqtmk (natural__content natural)))))
(define-fun natural__ref_natural__content__projection ((a natural__ref)) natural 
  (natural__content a))

(define-fun dynamic_invariant ((temp___expr_39 Int) (temp___is_init_35 Bool)
  (temp___skip_constant_36 Bool) (temp___do_toplevel_37 Bool)
  (temp___do_typ_inv_38 Bool)) Bool (=>
                                    (or (= temp___is_init_35 true)
                                    (<= 0 2147483647)) (in_range
                                    temp___expr_39)))

(declare-fun id (Int) Int)

(declare-fun id__function_guard (Int Int) Bool)

;; id__post_axiom
  (assert
  (forall ((x Int))
  (! (=> (dynamic_invariant x true true true true)
     (let ((result (id x)))
     (=> (id__function_guard result x) (dynamic_invariant result true false
     true true)))) :pattern ((id x)) )))

;; id__def_axiom
  (assert
  (forall ((x Int))
  (! (=> (dynamic_invariant x true true true true) (= (id x) x)) :pattern (
  (id x)) )))

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(declare-const d Int)

(declare-const attr__ATTRIBUTE_ADDRESS1 Int)

(define-fun to_rep ((x natural)) Int (naturalqtint x))

(declare-fun of_rep (Int) natural)

;; inversion_axiom
  (assert
  (forall ((x natural)) (! (= (of_rep (to_rep x)) x) :pattern ((to_rep x)) )))

;; range_axiom
  (assert
  (forall ((x natural)) (! (in_range (to_rep x)) :pattern ((to_rep x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range x) (= (to_rep (of_rep x)) x)) :pattern ((to_rep
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
                           (forall ((temp___idx_155 Int))
                           (=>
                           (and (<= a__first temp___idx_155)
                           (<= temp___idx_155 a__last))
                           (= (to_rep (select a temp___idx_155)) (to_rep
                                                                 (select b (+ (- b__first a__first) temp___idx_155)))))))
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
  (forall ((temp___idx_155 Int))
  (=> (and (<= a__first temp___idx_155) (<= temp___idx_155 a__last))
  (= (to_rep (select a temp___idx_155)) (to_rep
                                        (select b (+ (- b__first a__first) temp___idx_155)))))))))))

(declare-sort tindexB 0)

(declare-fun tindexBqtint (tindexB) Int)

;; tindexB'axiom
  (assert
  (forall ((i tindexB))
  (and (<= (- 2147483648) (tindexBqtint i)) (<= (tindexBqtint i) 2147483647))))

(define-fun in_range1 ((x Int)) Bool (and (<= (- 2147483648) x)
                                     (<= x 2147483647)))

(declare-fun attr__ATTRIBUTE_IMAGE1 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check1 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE1 (us_image) Int)

(declare-fun user_eq1 (tindexB tindexB) Bool)

(declare-const dummy1 tindexB)

(declare-datatypes ((tindexB__ref 0))
(((tindexB__refqtmk (tindexB__content tindexB)))))
(define-fun tindexB__ref_tindexB__content__projection ((a tindexB__ref)) tindexB 
  (tindexB__content a))

(declare-const a__first tindexB)

(declare-const a__last tindexB)

(declare-const attr__ATTRIBUTE_ADDRESS2 Int)

(declare-const b__first tindexB)

(declare-const b__last tindexB)

(declare-const attr__ATTRIBUTE_ADDRESS3 Int)

(declare-const c__first tindexB)

(declare-const c__last tindexB)

(declare-const attr__ATTRIBUTE_ADDRESS4 Int)

(define-fun to_rep1 ((x tindexB)) Int (tindexBqtint x))

(declare-fun of_rep1 (Int) tindexB)

;; inversion_axiom
  (assert
  (forall ((x tindexB))
  (! (= (of_rep1 (to_rep1 x)) x) :pattern ((to_rep1 x)) )))

;; range_axiom
  (assert
  (forall ((x tindexB)) (! (in_range1 (to_rep1 x)) :pattern ((to_rep1 x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range1 x) (= (to_rep1 (of_rep1 x)) x)) :pattern ((to_rep1
                                                              (of_rep1 x))) )))

(declare-const first Int)

(define-fun dynamic_property ((first_int Int) (last_int Int)
  (x Int)) Bool (and (<= first_int x) (<= x last_int)))

(declare-fun attr__ATTRIBUTE_IMAGE2 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check2 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE2 (us_image) Int)

(declare-fun user_eq2 (tindexB tindexB) Bool)

(declare-const dummy2 tindexB)

(declare-datatypes ((index__ref 0))
(((index__refqtmk (index__content tindexB)))))
(define-fun index__ref_index__content__projection ((a index__ref)) tindexB 
  (index__content a))

(declare-fun concat1 ((Array Int natural) Int Int (Array Int natural) Int
  Int) (Array Int natural))

;; concat_def
  (assert
  (forall ((a (Array Int natural)) (b (Array Int natural)))
  (forall ((a_first Int) (a_last Int) (b_first Int) (b_last Int))
  (forall ((i Int))
  (! (and
     (=> (and (<= a_first i) (<= i a_last))
     (= (select (concat1 a a_first a_last b b_first b_last) i) (select a i)))
     (=> (< a_last i)
     (= (select (concat1 a a_first a_last b b_first b_last) i) (select b (+ (- i a_last) (- b_first 1)))))) :pattern ((select 
  (concat1 a a_first a_last b b_first b_last) i)) )))))

(declare-fun concat_singleton_left (natural Int (Array Int natural) Int
  Int) (Array Int natural))

;; concat_singleton_left_def
  (assert
  (forall ((a natural))
  (forall ((b (Array Int natural)))
  (forall ((a_first Int) (b_first Int) (b_last Int))
  (! (and
     (= (select (concat_singleton_left a a_first b b_first b_last) a_first) a)
     (forall ((i Int))
     (! (=> (< a_first i)
        (= (select (concat_singleton_left a a_first b b_first b_last) i) (select b (+ (- i a_first) (- b_first 1))))) :pattern ((select 
     (concat_singleton_left a a_first b b_first b_last) i)) ))) :pattern (
  (concat_singleton_left a a_first b b_first b_last)) )))))

(declare-fun concat_singleton_right ((Array Int natural) Int Int
  natural) (Array Int natural))

;; concat_singleton_right_def
  (assert
  (forall ((a (Array Int natural)))
  (forall ((b natural))
  (forall ((a_first Int) (a_last Int))
  (! (and
     (= (select (concat_singleton_right a a_first a_last b) (+ a_last 1)) b)
     (forall ((i Int))
     (! (=> (and (<= a_first i) (<= i a_last))
        (= (select (concat_singleton_right a a_first a_last b) i) (select a i))) :pattern ((select 
     (concat_singleton_right a a_first a_last b) i)) :pattern ((select a i)) ))) :pattern (
  (concat_singleton_right a a_first a_last b)) )))))

(declare-fun concat_singletons (natural Int natural) (Array Int natural))

;; concat_singletons_def
  (assert
  (forall ((a natural) (b natural))
  (forall ((a_first Int))
  (! (and (= (select (concat_singletons a a_first b) a_first) a)
     (= (select (concat_singletons a a_first b) (+ a_first 1)) b)) :pattern (
  (concat_singletons a a_first b)) ))))

(declare-fun singleton1 (natural Int) (Array Int natural))

;; singleton_def
  (assert
  (forall ((v natural))
  (forall ((i Int))
  (! (= (select (singleton1 v i) i) v) :pattern ((select (singleton1 v i) i)) ))))

(declare-sort t 0)

(declare-fun first1 (t) tindexB)

(declare-fun last (t) tindexB)

(declare-fun mk (Int Int) t)

;; mk_def
  (assert
  (forall ((f Int) (l Int))
  (! (=> (in_range1 f)
     (=> (in_range1 l)
     (and (= (to_rep1 (first1 (mk f l))) f) (= (to_rep1 (last (mk f l))) l)))) :pattern (
  (mk f l)) )))

(define-fun dynamic_property1 ((range_first Int) (range_last Int) (low Int)
  (high Int)) Bool (and (in_range1 low)
                   (and (in_range1 high)
                   (=> (<= low high)
                   (and (dynamic_property range_first range_last low)
                   (dynamic_property range_first range_last high))))))

(declare-datatypes ((us_t 0))
(((us_tqtmk (elts (Array Int natural))(rt t)))))
(define-fun to_array ((a us_t)) (Array Int natural) (elts a))

(define-fun of_array ((a (Array Int natural)) (f Int)
  (l Int)) us_t (us_tqtmk a (mk f l)))

(define-fun first2 ((a us_t)) Int (to_rep1 (first1 (rt a))))

(define-fun last1 ((a us_t)) Int (to_rep1 (last (rt a))))

(define-fun length1 ((a us_t)) Int (ite (<= (first2 a) (last1 a))
                                   (+ (- (last1 a) (first2 a)) 1) 0))

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
  (y us_t)) Bool (bool_eq (elts x) (to_rep1 (first1 (rt x)))
                 (to_rep1 (last (rt x))) (elts y) (to_rep1 (first1 (rt y)))
                 (to_rep1 (last (rt y)))))

(declare-fun user_eq3 (us_t us_t) Bool)

(declare-const dummy3 us_t)

(declare-datatypes ((tnat_arrayB__ref 0))
(((tnat_arrayB__refqtmk (tnat_arrayB__content us_t)))))
(define-fun tnat_arrayB__ref_tnat_arrayB__content__projection ((a tnat_arrayB__ref)) us_t 
  (tnat_arrayB__content a))

(declare-datatypes ((nat_array__ref 0))
(((nat_array__refqtmk (nat_array__content us_t)))))
(define-fun nat_array__ref_nat_array__content__projection ((a nat_array__ref)) us_t 
  (nat_array__content a))

(declare-datatypes ((t4b__ref 0))
(((t4b__refqtmk (t4b__content us_t)))))
(define-fun t4b__ref_t4b__content__projection ((a t4b__ref)) us_t (t4b__content
                                                                  a))

(declare-datatypes ((t6b__ref 0))
(((t6b__refqtmk (t6b__content us_t)))))
(define-fun t6b__ref_t6b__content__projection ((a t6b__ref)) us_t (t6b__content
                                                                  a))

(declare-sort t7b 0)

(declare-fun t7bqtint (t7b) Int)

;; t7b'axiom
  (assert (forall ((i t7b)) (and (<= 4 (t7bqtint i)) (<= (t7bqtint i) 7))))

(define-fun in_range2 ((x Int)) Bool (and (<= 4 x) (<= x 7)))

(declare-fun attr__ATTRIBUTE_IMAGE3 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check3 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE3 (us_image) Int)

(declare-fun user_eq4 (t7b t7b) Bool)

(declare-const dummy4 t7b)

(declare-datatypes ((t7b__ref 0))
(((t7b__refqtmk (t7b__content t7b)))))
(define-fun t7b__ref_t7b__content__projection ((a t7b__ref)) t7b (t7b__content
                                                                 a))

(declare-sort t9b 0)

(declare-fun t9bqtint (t9b) Int)

;; t9b'axiom
  (assert (forall ((i t9b)) (and (<= 5 (t9bqtint i)) (<= (t9bqtint i) 8))))

(define-fun in_range3 ((x Int)) Bool (and (<= 5 x) (<= x 8)))

(declare-fun attr__ATTRIBUTE_IMAGE4 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check4 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE4 (us_image) Int)

(declare-fun user_eq5 (t9b t9b) Bool)

(declare-const dummy5 t9b)

(declare-datatypes ((t9b__ref 0))
(((t9b__refqtmk (t9b__content t9b)))))
(define-fun t9b__ref_t9b__content__projection ((a t9b__ref)) t9b (t9b__content
                                                                 a))

(declare-datatypes ((t13b__ref 0))
(((t13b__refqtmk (t13b__content us_t)))))
(define-fun t13b__ref_t13b__content__projection ((a t13b__ref)) us_t 
  (t13b__content a))

(declare-fun concat__a__aggregate_def (Int Int Int) us_t)

(declare-fun concat__b__aggregate_def (Int Int Int) us_t)

(declare-fun temp_____aggregate_def_221 (Int Int Int Int Int Int Int Int Int
  Int) us_t)

(define-fun dynamic_invariant1 ((temp___expr_181 Int)
  (temp___is_init_177 Bool) (temp___skip_constant_178 Bool)
  (temp___do_toplevel_179 Bool)
  (temp___do_typ_inv_180 Bool)) Bool (=>
                                     (or (= temp___is_init_177 true)
                                     (<= first 8)) (dynamic_property 
                                     first 8 temp___expr_181)))

;; first__def_axiom
  (assert (= first d))

(define-fun dynamic_invariant2 ((temp___expr_188 us_t)
  (temp___is_init_184 Bool) (temp___skip_constant_185 Bool)
  (temp___do_toplevel_186 Bool)
  (temp___do_typ_inv_187 Bool)) Bool (=>
                                     (not (= temp___skip_constant_185 true))
                                     (and (dynamic_property1 first 8
                                     (first2 temp___expr_188)
                                     (last1 temp___expr_188))
                                     (and (= (first2 temp___expr_188) 
                                     d) (= (last1 temp___expr_188) 8)))))

(define-fun default_initial_assumption ((temp___expr_190 us_t)
  (temp___skip_top_level_191 Bool)) Bool (and
                                         (= (first2 temp___expr_190) 
                                         first)
                                         (= (last1 temp___expr_190) 8)))

(declare-const rliteral natural)

;; rliteral_axiom
  (assert (= (naturalqtint rliteral) 0))

;; def_axiom
  (assert
  (forall ((temp___195 Int) (temp___196 Int) (temp___197 Int))
  (let ((temp___194 (concat__a__aggregate_def temp___195 temp___196
                    temp___197)))
  (=> (dynamic_invariant temp___195 true true true true)
  (and
  (=> (dynamic_property1 first 8 temp___196 temp___197)
  (and (= (first2 temp___194) temp___196) (= (last1 temp___194) temp___197)))
  (forall ((temp___198 Int))
  (= (select (to_array temp___194) temp___198) rliteral)))))))

(declare-const rliteral1 natural)

;; rliteral_axiom
  (assert (= (naturalqtint rliteral1) 1))

;; def_axiom
  (assert
  (forall ((temp___203 Int) (temp___204 Int) (temp___205 Int))
  (let ((temp___202 (concat__b__aggregate_def temp___203 temp___204
                    temp___205)))
  (=> (dynamic_invariant temp___203 true true true true)
  (and
  (=> (dynamic_property1 first 8 temp___204 temp___205)
  (and (= (first2 temp___202) temp___204) (= (last1 temp___202) temp___205)))
  (forall ((temp___206 Int))
  (= (select (to_array temp___202) temp___206) rliteral1)))))))

;; def_axiom
  (assert
  (forall ((temp___223 Int) (temp___224 Int) (temp___225 Int)
  (temp___226 Int) (temp___227 Int) (temp___228 Int) (temp___229 Int)
  (temp___230 Int) (temp___231 Int) (temp___232 Int))
  (let ((temp___222 (temp_____aggregate_def_221 temp___223 temp___224
                    temp___225 temp___226 temp___227 temp___228 temp___229
                    temp___230 temp___231 temp___232)))
  (=>
  (and
  (and (dynamic_invariant temp___223 true true true true) (dynamic_invariant
  temp___224 true true true true))
  (and
  (and
  (and (dynamic_invariant temp___225 true true true true) (dynamic_invariant
  temp___226 true true true true)) (dynamic_invariant temp___227 true true
  true true))
  (and
  (and (dynamic_invariant temp___228 true true true true) (dynamic_invariant
  temp___229 true true true true)) (dynamic_invariant temp___230 true true
  true true))))
  (and
  (=> (dynamic_property1 first 8 temp___231 temp___232)
  (and (= (first2 temp___222) temp___231) (= (last1 temp___222) temp___232)))
  (and
  (and (= (select (to_array temp___222) (+ d 0)) rliteral)
  (= (select (to_array temp___222) (+ d 1)) rliteral))
  (and
  (and
  (and (= (select (to_array temp___222) (+ d 2)) rliteral)
  (= (select (to_array temp___222) (+ d 3)) rliteral))
  (= (select (to_array temp___222) (+ d 4)) rliteral1))
  (and
  (and (= (select (to_array temp___222) (+ d 5)) rliteral1)
  (= (select (to_array temp___222) (+ d 6)) rliteral1))
  (= (select (to_array temp___222) (+ d 7)) rliteral1)))))))))

(assert
;; defqtvc
 ;; File "concat.adb", line 1, characters 0-0
  (not
  (let ((o (id 1)))
  (=>
  (and (id__function_guard o 1)
  (and (dynamic_invariant o true false true true) (= o 1)))
  (forall ((v Int))
  (=> (= v o)
  (=> (dynamic_invariant v true false true true)
  (=> (= v d)
  (=> (dynamic_invariant d true false true true)
  (let ((temp___199 (concat__a__aggregate_def 0 d 8)))
  (=> (= (first2 temp___199) d)
  (=> (= (last1 temp___199) 8)
  (=>
  (ite (<= (first2 temp___199) (last1 temp___199))
  (and (<= first 8)
  (= (- (last1 temp___199) (first2 temp___199)) (- 8 first))) (< 8 first))
  (let ((concat__a__assume (of_array
                           (slide (to_array temp___199) (first2 temp___199)
                           first) first 8)))
  (forall ((a (Array Int natural)))
  (=> (= a (to_array concat__a__assume))
  (=> (= (to_rep1 a__first) (first2 concat__a__assume))
  (=> (= (to_rep1 a__last) (last1 concat__a__assume))
  (=>
  (and (dynamic_property1 first 8 (to_rep1 a__first) (to_rep1 a__last))
  (and (= (to_rep1 a__first) d) (= (to_rep1 a__last) 8)))
  (let ((temp___207 (concat__b__aggregate_def 1 d 8)))
  (=> (= (first2 temp___207) d)
  (=> (= (last1 temp___207) 8)
  (=> (<= (first2 temp___207) (last1 temp___207)) (<= first 8))))))))))))))))))))))))
(check-sat)
(exit)
