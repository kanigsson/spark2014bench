;; produced by cvc4_16.drv ;;
(set-logic AUFBVFPDTNIRA)
(set-info :smt-lib-version 2.6)
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

(define-fun min ((x Int) (y Int)) Int (ite (<= x y) x y))

(define-fun max ((x Int) (y Int)) Int (ite (<= x y) y x))

;; Min_r
  (assert (forall ((x Int) (y Int)) (=> (<= y x) (= (min x y) y))))

;; Max_l
  (assert (forall ((x Int) (y Int)) (=> (<= y x) (= (max x y) x))))

;; Min_comm
  (assert (forall ((x Int) (y Int)) (= (min x y) (min y x))))

;; Max_comm
  (assert (forall ((x Int) (y Int)) (= (max x y) (max y x))))

;; Min_assoc
  (assert
  (forall ((x Int) (y Int) (z Int)) (= (min (min x y) z) (min x (min y z)))))

;; Max_assoc
  (assert
  (forall ((x Int) (y Int) (z Int)) (= (max (max x y) z) (max x (max y z)))))

(define-fun in_range ((x Int)) Bool (or (= x 0) (= x 1)))

(declare-fun attr__ATTRIBUTE_IMAGE (Bool) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE (us_image) Bool)

(declare-sort value 0)

(declare-fun valueqtint (value) Int)

;; value'axiom
  (assert
  (forall ((i value)) (and (<= 0 (valueqtint i)) (<= (valueqtint i) 10000))))

(define-fun in_range1 ((x Int)) Bool (and (<= 0 x) (<= x 10000)))

(declare-fun attr__ATTRIBUTE_IMAGE1 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check1 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE1 (us_image) Int)

(declare-fun user_eq (value value) Bool)

(declare-const dummy value)

(declare-datatypes ((value__ref 0))
(((value__refqtmk (value__content value)))))
(define-fun value__ref_value__content__projection ((a value__ref)) value 
  (value__content a))

(define-fun to_rep ((x value)) Int (valueqtint x))

(declare-fun of_rep (Int) value)

;; inversion_axiom
  (assert
  (forall ((x value)) (! (= (of_rep (to_rep x)) x) :pattern ((to_rep x)) )))

;; range_axiom
  (assert
  (forall ((x value)) (! (in_range1 (to_rep x)) :pattern ((to_rep x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range1 x) (= (to_rep (of_rep x)) x)) :pattern ((to_rep
                                                            (of_rep x))) )))

(declare-datatypes ((map__ref 0))
(((map__refqtmk (map__content (Array Int value))))))
(declare-fun slide ((Array Int value) Int Int) (Array Int value))

;; slide_eq
  (assert
  (forall ((a (Array Int value)))
  (forall ((first Int))
  (! (= (slide a first first) a) :pattern ((slide a first first)) ))))

;; slide_def
  (assert
  (forall ((a (Array Int value)))
  (forall ((old_first Int))
  (forall ((new_first Int))
  (forall ((i Int))
  (! (= (select (slide a old_first new_first) i) (select a (- i (- new_first old_first)))) :pattern ((select 
  (slide a old_first new_first) i)) ))))))

(define-fun bool_eq ((a (Array Int value)) (a__first Int) (a__last Int)
  (b (Array Int value)) (b__first Int)
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
  (forall ((a (Array Int value)) (b (Array Int value)))
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

(declare-const i5s (Array Int value))

(declare-const attr__ATTRIBUTE_ADDRESS1 Int)

(declare-const attr__ATTRIBUTE_ADDRESS2 Int)

(declare-const attr__ATTRIBUTE_ADDRESS3 Int)

(declare-const attr__ATTRIBUTE_ADDRESS4 Int)

(define-fun dynamic_invariant ((temp___expr_161 Int)
  (temp___is_init_157 Bool) (temp___skip_constant_158 Bool)
  (temp___do_toplevel_159 Bool)
  (temp___do_typ_inv_160 Bool)) Bool (=>
                                     (or (= temp___is_init_157 true)
                                     (<= 0 10000)) (in_range1
                                     temp___expr_161)))

(declare-sort index 0)

(declare-fun indexqtint (index) Int)

;; index'axiom
  (assert
  (forall ((i index)) (and (<= 1 (indexqtint i)) (<= (indexqtint i) 100))))

(define-fun in_range2 ((x Int)) Bool (and (<= 1 x) (<= x 100)))

(declare-fun attr__ATTRIBUTE_IMAGE2 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check2 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE2 (us_image) Int)

(declare-fun user_eq1 (index index) Bool)

(declare-const dummy1 index)

(declare-datatypes ((index__ref 0))
(((index__refqtmk (index__content index)))))
(define-fun index__ref_index__content__projection ((a index__ref)) index 
  (index__content a))

(declare-fun sorted ((Array Int value)) Bool)

(declare-fun sorted__function_guard (Bool (Array Int value)) Bool)

;; temp___result_189'def
  (assert
  (forall ((temp___188 (Array Int value))) (sorted__function_guard
  (sorted temp___188) temp___188)))

(define-fun dynamic_invariant1 ((temp___expr_187 (Array Int value))
  (temp___is_init_183 Bool) (temp___skip_constant_184 Bool)
  (temp___do_toplevel_185 Bool)
  (temp___do_typ_inv_186 Bool)) Bool (=> (= temp___do_toplevel_185 true)
                                     (=> (= temp___is_init_183 true)
                                     (= (sorted temp___expr_187) true))))

;; temp___result_197'def
  (assert
  (forall ((temp___196 (Array Int value))) (sorted__function_guard
  (sorted temp___196) temp___196)))

(define-fun dynamic_predicate ((temp___195 (Array Int value))) Bool (= 
  (sorted temp___195) true))

(define-fun dynamic_invariant2 ((temp___expr_168 Int)
  (temp___is_init_164 Bool) (temp___skip_constant_165 Bool)
  (temp___do_toplevel_166 Bool)
  (temp___do_typ_inv_167 Bool)) Bool (=>
                                     (or (= temp___is_init_164 true)
                                     (<= 1 100)) (in_range2 temp___expr_168)))

;; sorted__post_axiom
  (assert true)

;; sorted__def_axiom
  (assert
  (forall ((v (Array Int value)))
  (! (= (= (sorted v) true)
     (forall ((j Int))
     (=> (and (<= 1 j) (<= j 99))
     (<= (to_rep (select v j)) (to_rep (select v (+ j 1))))))) :pattern (
  (sorted v)) )))

(assert
;; defqtvc
 ;; File "math.ads", line 14, characters 0-0
  (not
  (forall ((v (Array Int value)) (tmp_value Int) (o Int) (prev_value Int)
  (j Int) (temp___loop_entry_221 (Array Int value)) (tmp_value1 Int)
  (o1 value))
  (=> (dynamic_invariant1 i5s true false true true)
  (=> (dynamic_invariant1 i5s true false true true)
  (=> (dynamic_invariant1 v true false true true)
  (=> (= (to_rep (select v 1)) o)
  (=> (= prev_value o)
  (=> (dynamic_invariant prev_value true false true true)
  (=> (= tmp_value1 prev_value)
  (=> (dynamic_invariant tmp_value false false true true)
  (=> (= j 1)
  (=> (= (and (ite (<= 1 j) true false) (ite (<= j 100) true false)) true)
  (=> (= temp___loop_entry_221 v)
  (=> (= (to_rep o1) tmp_value1)
  (let ((temp___209 (store v j o1)))
  (=> (dynamic_predicate temp___209)
  (forall ((v1 (Array Int value)))
  (=> (= v1 temp___209)
  (forall ((o2 Int))
  (=> (= (to_rep (select temp___loop_entry_221 j)) o2)
  (forall ((usf Int))
  (=>
  (= (and (ite (<= (+ j 1) usf) true false) (ite (<= usf 100) true false)) true)
  (<= 1 usf))))))))))))))))))))))))
(check-sat)