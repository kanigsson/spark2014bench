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

(declare-datatypes ((set__ref 0))
(((set__refqtmk (set__content us_rep)))))
(define-fun set__ref_set__content__projection ((a set__ref)) us_rep (set__content
                                                                    a))

(declare-fun length (us_rep) Int)

(declare-fun length__function_guard (Int us_rep) Bool)

(declare-sort count_type 0)

(declare-fun count_typeqtint (count_type) Int)

;; count_type'axiom
  (assert
  (forall ((i count_type))
  (and (<= 0 (count_typeqtint i)) (<= (count_typeqtint i) 2147483647))))

(define-fun in_range ((x Int)) Bool (and (<= 0 x) (<= x 2147483647)))

(declare-fun attr__ATTRIBUTE_IMAGE (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE (us_image) Int)

(declare-fun user_eq1 (count_type count_type) Bool)

(declare-const dummy1 count_type)

(declare-datatypes ((count_type__ref 0))
(((count_type__refqtmk (count_type__content count_type)))))
(define-fun count_type__ref_count_type__content__projection ((a count_type__ref)) count_type 
  (count_type__content a))

(define-fun dynamic_invariant ((temp___expr_189 Int)
  (temp___is_init_185 Bool) (temp___skip_constant_186 Bool)
  (temp___do_toplevel_187 Bool)
  (temp___do_typ_inv_188 Bool)) Bool (=>
                                     (or (= temp___is_init_185 true)
                                     (<= 0 2147483647)) (in_range
                                     temp___expr_189)))

(declare-fun oeq (us_rep us_rep) Bool)

(declare-fun oeq__function_guard (Bool us_rep us_rep) Bool)

(declare-fun is_empty (us_rep) Bool)

(declare-fun is_empty__function_guard (Bool us_rep) Bool)

;; user_eq__def_axiom
  (assert
  (forall ((a us_rep) (b us_rep))
  (! (= (user_eq a b) (oeq a b)) :pattern ((user_eq a b)) )))

(define-fun default_initial_assumption ((temp___expr_303 us_rep)
  (temp___skip_top_level_304 Bool)) Bool (=>
                                         (not
                                         (= temp___skip_top_level_304 true))
                                         (= (is_empty temp___expr_303) true)))

;; length__post_axiom
  (assert
  (forall ((container us_rep)) (! (dynamic_invariant (length container) true
  false true true) :pattern ((length container)) )))

(declare-fun num_overlaps (us_rep us_rep) Int)

(declare-fun num_overlaps__function_guard (Int us_rep us_rep) Bool)

(declare-fun ole (us_rep us_rep) Bool)

(declare-fun ole__function_guard (Bool us_rep us_rep) Bool)

(declare-fun no_overlap (us_rep us_rep) Bool)

(declare-fun no_overlap__function_guard (Bool us_rep us_rep) Bool)

(declare-fun intersection1 (us_rep us_rep) us_rep)

(declare-fun intersection__function_guard (us_rep us_rep us_rep) Bool)

;; num_overlaps__post_axiom
  (assert
  (forall ((left us_rep) (right us_rep))
  (! (let ((result (num_overlaps left right)))
     (and
     (and
     (and
     (and (= result (length (intersection1 left right)))
     (ite (= (ole left right) true) (= result (length left))
     (< result (length left))))
     (ite (= (ole right left) true) (= result (length right))
     (< result (length right))))
     (= (= result 0) (= (no_overlap left right) true))) (dynamic_invariant
     result true false true true))) :pattern ((num_overlaps left right)) )))

(declare-const left us_rep)

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(declare-const right us_rep)

(declare-const attr__ATTRIBUTE_ADDRESS1 Int)

(declare-sort tcount_typeB 0)

(declare-fun tcount_typeBqtint (tcount_typeB) Int)

;; tcount_typeB'axiom
  (assert
  (forall ((i tcount_typeB))
  (and (<= (- 2147483648) (tcount_typeBqtint i))
  (<= (tcount_typeBqtint i) 2147483647))))

(define-fun in_range1 ((x Int)) Bool (and (<= (- 2147483648) x)
                                     (<= x 2147483647)))

(declare-fun attr__ATTRIBUTE_IMAGE1 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check1 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE1 (us_image) Int)

(declare-fun user_eq2 (tcount_typeB tcount_typeB) Bool)

(declare-const dummy2 tcount_typeB)

(declare-datatypes ((tcount_typeB__ref 0))
(((tcount_typeB__refqtmk (tcount_typeB__content tcount_typeB)))))
(define-fun tcount_typeB__ref_tcount_typeB__content__projection ((a tcount_typeB__ref)) tcount_typeB 
  (tcount_typeB__content a))

(define-fun in_range2 ((x Int)) Bool (or (= x 0) (= x 1)))

(declare-fun attr__ATTRIBUTE_IMAGE2 (Bool) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check2 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE2 (us_image) Bool)

(declare-fun contains (us_rep Int) Bool)

(declare-fun contains__function_guard (Bool us_rep Int) Bool)

(declare-sort element_type 0)

(declare-fun element_typeqtint (element_type) Int)

;; element_type'axiom
  (assert
  (forall ((i element_type))
  (and (<= 1 (element_typeqtint i)) (<= (element_typeqtint i) 100))))

(define-fun in_range3 ((x Int)) Bool (and (<= 1 x) (<= x 100)))

(declare-fun attr__ATTRIBUTE_IMAGE3 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check3 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE3 (us_image) Int)

(declare-fun user_eq3 (element_type element_type) Bool)

(declare-const dummy3 element_type)

(declare-datatypes ((element_type__ref 0))
(((element_type__refqtmk (element_type__content element_type)))))
(define-fun element_type__ref_element_type__content__projection ((a element_type__ref)) element_type 
  (element_type__content a))

(define-fun dynamic_invariant1 ((temp___expr_295 Int)
  (temp___is_init_291 Bool) (temp___skip_constant_292 Bool)
  (temp___do_toplevel_293 Bool)
  (temp___do_typ_inv_294 Bool)) Bool (=>
                                     (or (= temp___is_init_291 true)
                                     (<= 1 100)) (in_range3 temp___expr_295)))

;; contains__post_axiom
  (assert
  (forall ((container us_rep))
  (forall ((item Int))
  (! (=> (dynamic_invariant1 item true true true true)
     (=> (= (distinct 1 0) true)
     (=>
     (exists ((e Int))
     (and (and (in_range3 e) (= (contains container e) true)) (= e item)))
     (= (contains container item) true)))) :pattern ((contains container
                                                     item)) ))))

;; ole__post_axiom
  (assert
  (forall ((left1 us_rep) (right1 us_rep))
  (! (= (= (ole left1 right1) true)
     (forall ((item Int))
     (=> (and (in_range3 item) (= (contains left1 item) true))
     (= (contains right1 item) true)))) :pattern ((ole left1 right1)) )))

;; oeq__post_axiom
  (assert
  (forall ((left1 us_rep) (right1 us_rep))
  (! (= (= (oeq left1 right1) true)
     (and (= (ole left1 right1) true) (= (ole right1 left1) true))) :pattern (
  (oeq left1 right1)) )))

;; is_empty__post_axiom
  (assert
  (forall ((container us_rep))
  (! (let ((result (is_empty container)))
     (and
     (= (= result true)
     (forall ((item Int))
     (not (and (in_range3 item) (= (contains container item) true)))))
     (= (= result true) (= (length container) 0)))) :pattern ((is_empty
                                                              container)) )))

(declare-fun includes_intersection (us_rep us_rep us_rep) Bool)

(declare-fun includes_intersection__function_guard (Bool us_rep us_rep
  us_rep) Bool)

;; includes_intersection__post_axiom
  (assert
  (forall ((container us_rep) (left1 us_rep) (right1 us_rep))
  (! (= (= (includes_intersection container left1 right1) true)
     (forall ((item Int))
     (=> (and (in_range3 item) (= (contains left1 item) true))
     (=> (= (contains right1 item) true) (= (contains container item) true))))) :pattern (
  (includes_intersection container left1 right1)) )))

;; no_overlap__post_axiom
  (assert
  (forall ((left1 us_rep) (right1 us_rep))
  (! (= (= (no_overlap left1 right1) true)
     (forall ((item Int))
     (=> (and (in_range3 item) (= (contains left1 item) true))
     (not (= (contains right1 item) true))))) :pattern ((no_overlap left1
                                                        right1)) )))

;; intersection__post_axiom
  (assert
  (forall ((left1 us_rep) (right1 us_rep))
  (! (let ((result (intersection1 left1 right1)))
     (and (and (= (ole result left1) true) (= (ole result right1) true))
     (= (includes_intersection result left1 right1) true))) :pattern (
  (intersection1 left1 right1)) )))

(assert
;; defqtvc
 ;; File "a-cofuse.ads", line 238, characters 0-0
  (not
  (let ((o (length right)))
  (=> (dynamic_invariant o true false true true) (in_range1
  (- 2147483647 o))))))
(check-sat)