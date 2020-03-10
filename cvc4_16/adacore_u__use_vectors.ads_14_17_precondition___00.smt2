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

(declare-sort us_main_type 0)

(declare-fun us_main_eq (us_main_type us_main_type) Bool)

(declare-sort us_rep 0)

(declare-fun bool_eq (us_rep us_rep) Bool)

(declare-const value__size Int)

(declare-const object__size Int)

(declare-const alignment Int)

;; value__size_axiom
  (assert (<= 0 value__size))

;; object__size_axiom
  (assert (<= 0 object__size))

;; alignment_axiom
  (assert (<= 0 alignment))

(declare-fun user_eq (us_rep us_rep) Bool)

(declare-const dummy us_rep)

(declare-datatypes ((sequence__ref 0))
(((sequence__refqtmk (sequence__content us_rep)))))
(define-fun sequence__ref_sequence__content__projection ((a sequence__ref)) us_rep 
  (sequence__content a))

(declare-fun length (us_rep) Int)

(declare-fun length__function_guard (Int us_rep) Bool)

(define-fun length1 ((x Int) (y Int)) Int (ite (<= x y) (+ (- y x) 1) 0))

(define-fun last ((container us_rep)) Int (+ 0 (length container)))

(declare-fun last__function_guard (Int us_rep) Bool)

(declare-fun get (us_rep Int) Int)

(declare-fun get__function_guard (Int us_rep Int) Bool)

(define-fun oeq ((left us_rep)
  (right us_rep)) Bool (and (= (length left) (length right)) (ite (forall
                                                                  ((n Int))
                                                                  (=>
                                                                  (and
                                                                  (<= 1 n)
                                                                  (<= n 
                                                                  (last left)))
                                                                  (= 
                                                                  (get left
                                                                  n) 
                                                                  (get right
                                                                  n))))
                                                             true false)))

(declare-fun oeq__function_guard (Bool us_rep us_rep) Bool)

;; user_eq__def_axiom
  (assert
  (forall ((a us_rep) (b us_rep))
  (! (= (user_eq a b) (oeq a b)) :pattern ((user_eq a b)) )))

(define-fun default_initial_assumption ((temp___expr_216 us_rep)
  (temp___skip_top_level_217 Bool)) Bool (=>
                                         (not
                                         (= temp___skip_top_level_217 true))
                                         (= (length temp___expr_216) 0)))

(declare-sort count_type 0)

(declare-fun count_typeqtint (count_type) Int)

;; count_type'axiom
  (assert
  (forall ((i count_type))
  (and (<= 0 (count_typeqtint i)) (<= (count_typeqtint i) 2147483647))))

(define-fun in_range1 ((x Int)) Bool (and (<= 0 x) (<= x 2147483647)))

(declare-fun attr__ATTRIBUTE_IMAGE1 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check1 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE1 (us_image) Int)

(declare-fun user_eq1 (count_type count_type) Bool)

(declare-const dummy1 count_type)

(declare-datatypes ((count_type__ref 0))
(((count_type__refqtmk (count_type__content count_type)))))
(define-fun count_type__ref_count_type__content__projection ((a count_type__ref)) count_type 
  (count_type__content a))

(define-fun dynamic_invariant ((temp___expr_223 Int)
  (temp___is_init_219 Bool) (temp___skip_constant_220 Bool)
  (temp___do_toplevel_221 Bool)
  (temp___do_typ_inv_222 Bool)) Bool (=>
                                     (or (= temp___is_init_219 true)
                                     (<= 0 2147483647)) (in_range1
                                     temp___expr_223)))

;; length__post_axiom
  (assert
  (forall ((container us_rep))
  (! (let ((result (length container)))
     (and (<= (+ 0 result) 42) (dynamic_invariant result true false true
     true))) :pattern ((length container)) )))

(declare-sort extended_index 0)

(declare-fun extended_indexqtint (extended_index) Int)

;; extended_index'axiom
  (assert
  (forall ((i extended_index))
  (and (<= 0 (extended_indexqtint i)) (<= (extended_indexqtint i) 42))))

(define-fun in_range2 ((x Int)) Bool (and (<= 0 x) (<= x 42)))

(declare-fun attr__ATTRIBUTE_IMAGE2 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check2 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE2 (us_image) Int)

(declare-fun user_eq2 (extended_index extended_index) Bool)

(declare-const dummy2 extended_index)

(declare-datatypes ((extended_index__ref 0))
(((extended_index__refqtmk (extended_index__content extended_index)))))
(define-fun extended_index__ref_extended_index__content__projection ((a extended_index__ref)) extended_index 
  (extended_index__content a))

(define-fun dynamic_invariant1 ((temp___expr_208 Int)
  (temp___is_init_204 Bool) (temp___skip_constant_205 Bool)
  (temp___do_toplevel_206 Bool)
  (temp___do_typ_inv_207 Bool)) Bool (=>
                                     (or (= temp___is_init_204 true)
                                     (<= 0 42)) (in_range2 temp___expr_208)))

(declare-sort element_type 0)

(declare-fun element_typeqtint (element_type) Int)

;; element_type'axiom
  (assert
  (forall ((i element_type))
  (and (<= 0 (element_typeqtint i)) (<= (element_typeqtint i) 1000))))

(define-fun in_range3 ((x Int)) Bool (and (<= 0 x) (<= x 1000)))

(declare-fun attr__ATTRIBUTE_IMAGE3 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check3 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE3 (us_image) Int)

(declare-fun user_eq3 (element_type element_type) Bool)

(declare-const dummy3 element_type)

(declare-datatypes ((element_type__ref 0))
(((element_type__refqtmk (element_type__content element_type)))))
(define-fun element_type__ref_element_type__content__projection ((a element_type__ref)) element_type 
  (element_type__content a))

(define-fun dynamic_invariant2 ((temp___expr_201 Int)
  (temp___is_init_197 Bool) (temp___skip_constant_198 Bool)
  (temp___do_toplevel_199 Bool)
  (temp___do_typ_inv_200 Bool)) Bool (=>
                                     (or (= temp___is_init_197 true)
                                     (<= 0 1000)) (in_range3
                                     temp___expr_201)))

;; get__post_axiom
  (assert
  (forall ((container us_rep))
  (forall ((position Int))
  (! (=>
     (and (dynamic_invariant1 position true true true true)
     (and (<= 1 position) (<= position (last container))))
     (dynamic_invariant2 (get container position) true false true true)) :pattern (
  (get container position)) ))))

(define-fun ole ((left us_rep)
  (right us_rep)) Bool (and (<= (length left) (length right)) (ite (forall
                                                                   ((n Int))
                                                                   (=>
                                                                   (and
                                                                   (<= 1 n)
                                                                   (<= n 
                                                                   (last
                                                                   left)))
                                                                   (= 
                                                                   (get left
                                                                   n) 
                                                                   (get right
                                                                   n))))
                                                              true false)))

(declare-fun ole__function_guard (Bool us_rep us_rep) Bool)

(declare-fun add (us_rep Int) us_rep)

(declare-fun add__function_guard (us_rep us_rep Int) Bool)

;; add__post_axiom
  (assert
  (forall ((container us_rep))
  (forall ((new_item Int))
  (! (=>
     (and (dynamic_invariant2 new_item true true true true)
     (and (< (length container) 2147483647) (< (last container) 42)))
     (let ((result (add container new_item)))
     (and
     (and (= (length result) (+ (length container) 1))
     (= (get result (last result)) new_item))
     (= (ole container result) true)))) :pattern ((add container new_item)) ))))

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(declare-const attr__ATTRIBUTE_ADDRESS1 Int)

(declare-sort t1b 0)

(declare-fun t1bqtint (t1b) Int)

;; t1b'axiom
  (assert (forall ((i t1b)) (and (<= 1 (t1bqtint i)) (<= (t1bqtint i) 42))))

(define-fun in_range4 ((x Int)) Bool (and (<= 1 x) (<= x 42)))

(declare-fun attr__ATTRIBUTE_IMAGE4 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check4 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE4 (us_image) Int)

(declare-fun user_eq4 (t1b t1b) Bool)

(declare-const dummy4 t1b)

(declare-datatypes ((t1b__ref 0))
(((t1b__refqtmk (t1b__content t1b)))))
(define-fun t1b__ref_t1b__content__projection ((a t1b__ref)) t1b (t1b__content
                                                                 a))

(assert
;; defqtvc
 ;; File "use_vectors.ads", line 12, characters 0-0
  (not
  (forall ((s us_rep) (s1 us_rep) (use_vectors__create__result us_rep)
  (usf Int))
  (=> (default_initial_assumption s false)
  (=>
  (exists ((k Int))
  (and (= k 1)
  (ite (= (and (ite (<= 1 k) true false) (ite (<= k 42) true false)) true)
  (let ((o (add s k)))
  (and
  (and (and (= (length o) (+ (length s) 1)) (= (get o (last o)) k))
  (= (ole s o) true))
  (exists ((s2 us_rep))
  (and (= s2 o)
  (let ((o1 (length s2)))
  (and (and (dynamic_invariant o1 true false true true) (<= (+ 0 o1) 42))
  (exists ((k1 Int))
  (and
  (and (= (length s1) k1)
  (forall ((j Int)) (=> (and (<= 1 j) (<= j k1)) (= (get s1 j) j))))
  (and
  (= (and (ite (in_range4 k1) true false) (ite (and (<= 1 k1) (<= k1 42))
                                          true false)) true)
  (= k1 42)))))))))) (= s1 s))))
  (=> (= use_vectors__create__result s1)
  (let ((o (last use_vectors__create__result)))
  (=>
  (and (dynamic_invariant1 o true false true true)
  (= o (+ 0 (length use_vectors__create__result))))
  (=> (= (and (ite (<= 1 usf) true false) (ite (<= usf o) true false)) true)
  (=> (in_range2 usf) (<= 1 usf)))))))))))
(check-sat)
(exit)
