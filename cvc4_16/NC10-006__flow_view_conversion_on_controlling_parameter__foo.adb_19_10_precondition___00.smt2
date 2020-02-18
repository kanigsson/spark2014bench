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

(declare-sort log_count 0)

(declare-fun log_countqtint (log_count) Int)

;; log_count'axiom
  (assert
  (forall ((i log_count))
  (and (<= 0 (log_countqtint i)) (<= (log_countqtint i) 10000))))

(define-fun in_range ((x Int)) Bool (and (<= 0 x) (<= x 10000)))

(declare-fun attr__ATTRIBUTE_IMAGE (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE (us_image) Int)

(declare-fun user_eq (log_count log_count) Bool)

(declare-const dummy log_count)

(declare-datatypes ((log_count__ref 0))
(((log_count__refqtmk (log_count__content log_count)))))
(define-fun log_count__ref_log_count__content__projection ((a log_count__ref)) log_count 
  (log_count__content a))

(define-fun to_rep ((x log_count)) Int (log_countqtint x))

(declare-fun of_rep (Int) log_count)

;; inversion_axiom
  (assert
  (forall ((x log_count))
  (! (= (of_rep (to_rep x)) x) :pattern ((to_rep x)) )))

;; range_axiom
  (assert
  (forall ((x log_count)) (! (in_range (to_rep x)) :pattern ((to_rep x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range x) (= (to_rep (of_rep x)) x)) :pattern ((to_rep
                                                           (of_rep x))) )))

(declare-datatypes ((us_split_fields 0))
(((us_split_fieldsqtmk
  (rec__logging__log_type_public__tmp log_count)(rec__ext__ us_private)))))
(define-fun us_split_fields_rec__logging__log_type_public__tmp__projection ((a us_split_fields)) log_count 
  (rec__logging__log_type_public__tmp a))

(define-fun us_split_fields_rec__ext____2__projection ((a us_split_fields)) us_private 
  (rec__ext__ a))

(declare-datatypes ((us_split_fields__ref 0))
(((us_split_fields__refqtmk (us_split_fields__content us_split_fields)))))
(define-fun us_split_fields__ref___split_fields__content__2__projection ((a us_split_fields__ref)) us_split_fields 
  (us_split_fields__content a))

(declare-datatypes ((us_rep 0))
(((us_repqtmk (us_split_fields1 us_split_fields)(attr__tag Int)))))
(define-fun us_rep___split_fields__2__projection ((a us_rep)) us_split_fields 
  (us_split_fields1 a))

(define-fun us_rep_attr__tag__2__projection ((a us_rep)) Int (attr__tag a))

(define-fun bool_eq ((a us_rep)
  (b us_rep)) Bool (ite (= (to_rep
                           (rec__logging__log_type_public__tmp
                           (us_split_fields1 a))) (to_rep
                                                  (rec__logging__log_type_public__tmp
                                                  (us_split_fields1 b))))
                   true false))

(declare-fun us_dispatch_eq (us_rep us_rep) Bool)

(declare-const us_tag Int)

(declare-const value__size Int)

(declare-const object__size Int)

(declare-const alignment Int)

;; value__size_axiom
  (assert (<= 0 value__size))

;; object__size_axiom
  (assert (<= 0 object__size))

;; alignment_axiom
  (assert (<= 0 alignment))

(declare-const logging__log_type_public__tmp__first__bit Int)

(declare-const logging__log_type_public__tmp__last__bit Int)

(declare-const logging__log_type_public__tmp__position Int)

;; logging__log_type_public__tmp__first__bit_axiom
  (assert (<= 0 logging__log_type_public__tmp__first__bit))

;; logging__log_type_public__tmp__last__bit_axiom
  (assert
  (< logging__log_type_public__tmp__first__bit logging__log_type_public__tmp__last__bit))

;; logging__log_type_public__tmp__position_axiom
  (assert (<= 0 logging__log_type_public__tmp__position))

(declare-fun user_eq1 (us_rep us_rep) Bool)

(declare-const dummy1 us_rep)

(declare-datatypes ((log_type_public__ref 0))
(((log_type_public__refqtmk (log_type_public__content us_rep)))))
(define-fun log_type_public__ref_log_type_public__content__projection ((a log_type_public__ref)) us_rep 
  (log_type_public__content a))

(declare-const log__attr__tag Int)

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(define-fun default_initial_assumption ((temp___expr_224 us_rep)
  (temp___skip_top_level_225 Bool)) Bool (= (attr__tag temp___expr_224) 
  us_tag))

(declare-fun log_size (us_rep) Int)

(declare-fun log_size__function_guard (Int us_rep) Bool)

(declare-fun log_size1 (Int us_rep) Int)

(declare-fun log_size__function_guard1 (Int Int us_rep) Bool)

(declare-fun init_log__specific_post (Int us_split_fields Int
  us_split_fields) Bool)

;; logging__log_type_public__compat_axiom
  (assert
  (forall ((logging__init_log__2__log__fields us_split_fields)
  (logging__init_log__2__log__old__fields us_split_fields))
  (forall ((log__attr__tag1 Int))
  (! (=> (init_log__specific_post us_tag logging__init_log__2__log__fields
     log__attr__tag1 logging__init_log__2__log__old__fields)
     (and
     (forall ((logging__init_log__2__log__fields1 us_split_fields)
     (log__attr__tag2 Int)) (log_size__function_guard
     (log_size
     (us_repqtmk logging__init_log__2__log__fields1 log__attr__tag2))
     (us_repqtmk logging__init_log__2__log__fields1 log__attr__tag2)))
     (= (log_size
        (us_repqtmk logging__init_log__2__log__fields log__attr__tag1)) 0))) :pattern ((init_log__specific_post
  us_tag logging__init_log__2__log__fields log__attr__tag1
  logging__init_log__2__log__old__fields)) ))))

(declare-fun append_to_log__specific_post (Int us_split_fields Int Int
  us_split_fields) Bool)

;; logging__log_type_public__compat_axiom
  (assert
  (forall ((logging__append_to_log__2__log__fields us_split_fields)
  (logging__append_to_log__2__log__old__fields us_split_fields))
  (forall ((log__attr__tag1 Int) (incr Int))
  (! (=> (append_to_log__specific_post us_tag
     logging__append_to_log__2__log__fields log__attr__tag1 incr
     logging__append_to_log__2__log__old__fields)
     (and
     (forall ((logging__append_to_log__2__log__old__fields1 us_split_fields)
     (log__attr__tag2 Int)) (log_size__function_guard
     (log_size
     (us_repqtmk logging__append_to_log__2__log__old__fields1
     log__attr__tag2))
     (us_repqtmk logging__append_to_log__2__log__old__fields1
     log__attr__tag2)))
     (and
     (forall ((logging__append_to_log__2__log__fields1 us_split_fields)
     (log__attr__tag2 Int)) (log_size__function_guard
     (log_size
     (us_repqtmk logging__append_to_log__2__log__fields1 log__attr__tag2))
     (us_repqtmk logging__append_to_log__2__log__fields1 log__attr__tag2)))
     (= (log_size
        (us_repqtmk logging__append_to_log__2__log__fields log__attr__tag1)) (+ 
     (log_size
     (us_repqtmk logging__append_to_log__2__log__old__fields log__attr__tag1)) 1))))) :pattern ((append_to_log__specific_post
  us_tag logging__append_to_log__2__log__fields log__attr__tag1 incr
  logging__append_to_log__2__log__old__fields)) ))))

(define-fun dynamic_invariant ((temp___expr_161 Int)
  (temp___is_init_157 Bool) (temp___skip_constant_158 Bool)
  (temp___do_toplevel_159 Bool)
  (temp___do_typ_inv_160 Bool)) Bool (=>
                                     (or (= temp___is_init_157 true)
                                     (<= 0 10000)) (in_range
                                     temp___expr_161)))

;; log_size__post_axiom
  (assert
  (forall ((log us_rep))
  (! (let ((result (log_size log)))
     (=> (log_size__function_guard result log) (dynamic_invariant result true
     false true true))) :pattern ((log_size log)) )))

;; log_size__post__dispatch_axiom
  (assert
  (forall ((attr__tag1 Int))
  (forall ((log us_rep))
  (! (let ((result (log_size1 attr__tag1 log)))
     (=> (log_size__function_guard1 result attr__tag1 log) (dynamic_invariant
     result true false true true))) :pattern ((log_size1 attr__tag1 log)) ))))

;; logging__log_type_public__compat_axiom
  (assert
  (forall ((log us_rep))
  (! (=> (log_size__function_guard1 (log_size1 us_tag log) us_tag log)
     (and
     (forall ((log1 us_rep)) (log_size__function_guard (log_size log1) log1))
     (= (log_size log) (log_size1 us_tag log)))) :pattern ((log_size1 
                                                           us_tag log)) )))

(assert
;; defqtvc
 ;; File "foo.adb", line 15, characters 0-0
  (not
  (forall ((logging__init_log__2__log__fields us_split_fields))
  (=>
  (forall ((o Int) (logging__init_log__2__log__fields1 us_split_fields))
  (log_size__function_guard
  (log_size (us_repqtmk logging__init_log__2__log__fields1 o))
  (us_repqtmk logging__init_log__2__log__fields1 o)))
  (=>
  (= (log_size (us_repqtmk logging__init_log__2__log__fields log__attr__tag)) 0)
  (forall ((log__split_fields us_split_fields))
  (=> (= log__split_fields logging__init_log__2__log__fields)
  (let ((o log__attr__tag))
  (=>
  (forall ((log__split_fields1 us_split_fields) (o1 Int))
  (log_size__function_guard1
  (log_size1 o1 (us_repqtmk log__split_fields1 o1)) o1
  (us_repqtmk log__split_fields1 o1)))
  (< (log_size1 o (us_repqtmk log__split_fields o)) 10000))))))))))
(check-sat)